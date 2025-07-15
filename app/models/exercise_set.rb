class ExerciseSet < ApplicationRecord
  include UniversalMethods

  belongs_to :unit
  belongs_to :intensity_technique, optional: true
  belongs_to :exercise

  # attributes: 
  # set_type String
  # reps Integer
  # load Float
  # intensity Integer

  WARMUP = [
    [
      {
        relative_load: 0.6,
        reps: 8,
      }
    ],
    [ 
      {
        relative_load: 0.5,
        reps: 8,
      },{
        relative_load: 0.7,
        reps: 5,
      }
    ],
    [ 
      {
        relative_load: 0.45,
        reps: 8,
      },{
        relative_load: 0.65,
        reps: 5,
      },{
        relative_load: 0.85,
        reps: 3,
      }
    ],
    [ 
      {
        relative_load: 0.45,
        reps: 8,
      },{
        relative_load: 0.6,
        reps: 5,
      },{
        relative_load: 0.75,
        reps: 4,
      },{
        relative_load: 0.85,
        reps: 3,
      }
    ]
  ]

  def get_set_type_position
    if order > warmup_type_count
      [order - warmup_type_count, type_count].join("/")
    else
      [order, type_count].join("/")
    end
  end

  def suggested_load
    additional_max_load = exercise.max_load || 0.0
    instrument_weight = get_load(exercise.instrument.weight, exercise.instrument.unit, unit)
    max_load = additional_max_load + instrument_weight
    if working_set?
      (exercise.maxed_rep_range? && !last_set?) ? (additional_max_load + 0.1*max_load).round(1) : additional_max_load
    else
      suggested_warmup = ExerciseSet::WARMUP[warmup_type_count - 1]
      suggested_load = max_load * suggested_warmup[order - 1][:relative_load] - instrument_weight
      suggested_load < 0 ? 0.0 : suggested_load.round(1)
    end
  end

  def suggested_rep_range
    if working_set?
      "(#{exercise.rep_range_min} - #{exercise.rep_range_max})"
    else
      suggested_warmup = ExerciseSet::WARMUP[warmup_type_count - 1]
      "(~#{suggested_warmup[order - 1][:reps]})"
    end
  end

  def suggested_reps
    if working_set?
      if exercise.maxed_rep_range? && !last_set?
        exercise.rep_range_min
      elsif exercise.same_reps? && !last_set?
        exercise.max_reps + 1
      elsif load < exercise.max_load
        exercise.working_sets.where(load: exercise.max_load).first.reps
      else
        exercise.max_reps
      end
    else
      suggested_warmup = ExerciseSet::WARMUP[warmup_type_count - 1]
      suggested_warmup[order - 1][:reps].to_i
    end
  end

  def warmup_type_count
    exercise.exercise_sets.where(set_type: "Warmup Set").count
  end

  def type_count
    type = set_type
    exercise.exercise_sets.where(set_type: type).count
  end

  def next_exercise
    if next_set == nil
      return nil
    elsif exercise != next_set.exercise
      return next_set.exercise
    else
      next_set.next_exercise
    end
  end

  def is_superset?
    exercise.exercise_group.exercises.count > 1
  end

  def last_set?
    !next_set || (exercise != next_set.exercise && exercise != next_set&.next_set&.exercise)
  end

  def working_set?
    set_type == "Working Set"
  end

  def next_set
    exercise_group = exercise.exercise_group
    workout = exercise_group.workout
    eg_exercises = exercise_group.exercises
    # if superset
    if eg_exercises.count > 1
      # if second db match is different from actual exercise
      if eg_exercises.second != exercise
        return eg_exercises.second.exercise_sets.find_by(order: order)
      # if second db does not match and exist first with higer order
      elsif eg_exercises.first.exercise_sets.find_by(order: order + 1)
        return eg_exercises.first.exercise_sets.find_by(order: order + 1)
      # if need to change exercise
      elsif workout.exercise_groups.find_by(order: exercise_group.order + 1)
        if workout.exercise_groups.find_by(order: exercise_group.order + 1).exercises.any?
          return workout.exercise_groups.find_by(order: exercise_group.order + 1).exercises.first.exercise_sets.find_by(order: 1)
        else
          return nil
        end
      end
      # nil if workout is done
      return nil
    # if not superset
    else
      # if exists higher set
      if exercise.exercise_sets.find_by(order: order + 1)
        return exercise.exercise_sets.find_by(order: order + 1)
      # if need to change exercise
      elsif workout.exercise_groups.find_by(order: exercise_group.order + 1)
        return workout.exercise_groups.find_by(order: exercise_group.order + 1).exercises.first.exercise_sets.find_by(order: 1)
      end
    end
    # nil if workout is done
    return nil
  end
end

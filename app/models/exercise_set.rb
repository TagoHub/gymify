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
    return load if (intensity && suggested_intensity) && (intensity > suggested_intensity) || updated_at.to_date == Date.today
    user = exercise.exercise_group.workout.program.user
    loads = exercise.working_sets.pluck(:load)
    avg_load = (loads.sum / loads.size) || 0.0
    instrument_weight = get_load(exercise.instrument.weight, exercise.instrument.unit, unit) || 0
    body_weight = exercise.body_weight ? get_load(user.weight || 70, user.weight_unit || Unit.find_by(name: "Kilograms"), unit) : 0
    max_load = avg_load + instrument_weight + body_weight
    if first_working_set?
      suggested_reps == exercise.rep_range_min ? round_to_half(avg_load + 0.1*max_load) : avg_load
    elsif working_set?
      first_working_set.load
    else
      suggested_warmup = ExerciseSet::WARMUP[warmup_type_count - 1]
      suggested_load = max_load * suggested_warmup[order - 1][:relative_load] - (instrument_weight + body_weight)
      suggested_load < 0 ? 0.0 : round_to_half(suggested_load)
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

  def rep_range
    "(#{exercise.rep_range_min} - #{exercise.rep_range_max})"
  end

  def suggested_reps
    return reps if intensity && suggested_intensity && (intensity > suggested_intensity) || updated_at.to_date == Date.today
    if first_working_set?
      all_reps = exercise.working_sets.pluck(:reps)
      avg_reps = (all_reps.sum / all_reps.size).to_i + 1
      (avg_reps > exercise.rep_range_max) ? exercise.rep_range_min : avg_reps
    elsif working_set?
      first_working_set.reps
    else
      suggested_warmup = ExerciseSet::WARMUP[warmup_type_count - 1]
      suggested_warmup[order - 1][:reps].to_i
    end
  end

  def first_working_set?
    first_working_set == self
  end

  def first_working_set
    exercise.exercise_sets.where(set_type: "Working Set").order(:order).first
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
    !next_set || (exercise.exercise_group != next_set.exercise.exercise_group)
  end

  def working_set?
    set_type == "Working Set"
  end

  def next_set
    exercise_group = exercise.exercise_group
    all_sets = exercise_group.all_sets
    all_sets.each_with_index do |set, index|
      if set == self
        return all_sets[index + 1] if index + 1 < all_sets.length
      end
    end
    new_exercise_group = exercise_group.workout.exercise_groups.find_by(order: exercise_group.order + 1)
    return nil unless new_exercise_group
    all_sets = new_exercise_group.all_sets
    return all_sets.first
  end
end

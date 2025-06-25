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
    order = self.order
    warmup_count = self.warmup_type_count
    type_count = self.type_count
    if order > warmup_count
      [order - warmup_count, type_count].join("/")
    else
      [order, type_count].join("/")
    end
  end

  def suggested_load
    additional_max_load = self.exercise.max_load || 0.0
    if self.set_type == "Warmup Set"
      suggested_warmup = ExerciseSet::WARMUP[self.warmup_type_count - 1]
      instrument_weight = get_load(self.exercise.instrument.weight, self.exercise.instrument.unit, self.unit)
      max_load = additional_max_load + instrument_weight
      suggested_load = max_load * suggested_warmup[self.order - 1][:relative_load] - instrument_weight
      suggested_load < 0 ? 0.0 : suggested_load.round(1)
    else
      additional_max_load
    end
  end

  def suggested_rep_range
    if self.set_type == "Warmup Set"
      suggested_warmup = ExerciseSet::WARMUP[self.warmup_type_count - 1]
      "(~#{suggested_warmup[self.order - 1][:reps]})"
    else
      "(#{self.exercise.rep_range_min} - #{self.exercise.rep_range_max})"
    end
  end

  def warmup_type_count
    self.exercise.exercise_sets.where(set_type: "Warmup Set").count
  end

  def type_count
    type = self.set_type
    self.exercise.exercise_sets.where(set_type: type).count
  end

  def next_exercise
    if self.next_set == nil
      return nil
    elsif self.exercise != self.next_set.exercise
      return self.next_set.exercise
    else
      self.next_set.next_exercise
    end
  end

  def next_set
    exercise = self.exercise
    exercise_group = exercise.exercise_group
    workout = exercise_group.workout
    eg_exercises = exercise_group.exercises
    # if superset
    if eg_exercises.count > 1
      # if second db match is different from actual exercise
      if eg_exercises.second != exercise
        return eg_exercises.second.exercise_sets.find_by(order: self.order)
      # if second db does not match and exist first with higer order
      elsif eg_exercises.first.exercise_sets.find_by(order: self.order + 1)
        return eg_exercises.first.exercise_sets.find_by(order: self.order + 1)
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
      if exercise.exercise_sets.find_by(order: self.order + 1)
        return exercise.exercise_sets.find_by(order: self.order + 1)
      # if need to change exercise
      elsif workout.exercise_groups.find_by(order: exercise_group.order + 1)
        return workout.exercise_groups.find_by(order: exercise_group.order + 1).exercises.first.exercise_sets.find_by(order: 1)
      end
    end
    # nil if workout is done
    return nil
  end
end

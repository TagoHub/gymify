class ExerciseSet < ApplicationRecord
  belongs_to :unit
  belongs_to :intensity_technique, optional: true
  belongs_to :exercise

  # attributes: 
  # set_type String
  # reps Integer
  # load Float
  # intensity Integer

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

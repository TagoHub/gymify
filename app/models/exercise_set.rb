class ExerciseSet < ApplicationRecord
  belongs_to :unit
  belongs_to :intensity_technique, optional: true
  belongs_to :exercise

  # attributes: 
  # set_type String
  # reps Integer
  # load Float
  # intensity Integer

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

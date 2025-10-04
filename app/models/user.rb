class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :programs, dependent: :destroy
  belongs_to :weight_unit, class_name: "Unit", optional: true
  belongs_to :height_unit, class_name: "Unit", optional: true

  def create_program json
    program = Program.find_or_initialize_by(name: json[:name], user: self)
    program.assign_attributes(
      user: self,
      name: json[:name],
      frequency: json[:frequency],
      level: json[:level],
      goal: json[:goal],
      duration: json[:duration],
      unit: Unit.find_by(name: json[:unit])
    )
    if program.save
      json[:workouts].each do |wk_json|
        workout = Workout.find_or_initialize_by(name: wk_json[:name], program: program)
        workout.assign_attributes(
          goal: wk_json[:goal],
          rest_days: wk_json[:rest_days]
        )
        if workout.save
          workout.exercise_groups.destroy_all
          eg_order = 1
          wk_json[:exercise_groups].each do |eg_json|
            exercise_group = ExerciseGroup.find_or_initialize_by(workout: workout, order: eg_order)
            exercise_group.assign_attributes(
              superset: wk_json[:exercise_groups].size > 1,
            )
            if exercise_group.save
              eg_order += 1
              eg_json[:exercises].each do |ex_json|
                template = Exercise.find_by(name: ex_json[:name], template: true)
                exercise =
                if template
                  copy = template.dup
                  copy.exercise_group = exercise_group
                  copy.template = false
                  copy.save!
                  copy.image.attach(template.image.blob) if template.image.attached?
                  copy
                else
                  Exercise.new(name: ex_json[:name], exercise_group: exercise_group, template: false)
                end
                exercise.assign_attributes(
                  exercise_group: exercise_group,
                  notes: ex_json[:notes] || "",
                  exercise_type: ex_json[:exercise_type] || exercise.exercise_type,
                  rep_range_min: ex_json[:rep_range_min] || exercise.rep_range_min,
                  rep_range_max: ex_json[:rep_range_max] || exercise.rep_range_max,
                  hole: ex_json[:hole] || exercise.hole,
                  unilateral: ex_json[:unilateral] || exercise.unilateral,
                  body_weight: ex_json[:body_weight] || exercise.body_weight,
                  template: false,
                  rest_time: ex_json[:rest_time] || exercise.rest_time,
                  unit: Unit.find_by(name: ex_json[:unit]) || exercise.unit,
                  instrument: Instrument.find_by(name: ex_json[:instrument]) || exercise.instrument,
                  attachment: Attachment.find_by(name: ex_json[:attachment]) || exercise.attachment,
                  grip: Grip.find_by(name: ex_json[:grip]) || exercise.grip,
                  primary_muscle_group: MuscleGroup.find_by(name: ex_json[:primary_muscle_group]) || exercise.primary_muscle_group
                )
                if exercise.save
                  es_order = 1
                  if ex_json[:exercise_sets]&.any?
                    ex_json[:exercise_sets].each do |es_json|
                      exercise_set = ExerciseSet.find_or_initialize_by(exercise: exercise, order: es_order)
                      exercise_set.assign_attributes(
                        set_type: es_json[:set_type] || "Working Set",
                        reps: es_json[:reps] || 0,
                        load: es_json[:load] || 0,
                        unit: Unit.find_by(name: es_json[:unit]) || Unit.find_by(name: "Kilograms"),
                        intensity: es_json[:intensity] || 8,
                        suggested_intensity: es_json[:suggested_intensity] || 8,
                        intensity_technique: IntensityTechnique.find_by(name: es_json[:intensity_technique]) || nil
                      )
                      exercise_set.save
                      es_order += 1
                    end
                  else
                    warmup_sets = ex_json[:warmup_sets] || 2
                    working_sets = ex_json[:working_sets] || 3
                    early_sets_rpe = ex_json[:early_sets_rpe] || 7
                    last_set_rpe = ex_json[:last_set_rpe] || 9
                    load_unit =  Unit.find_by(name: ex_json[:load_unit]) || Unit.find_by(name: "Kilograms")
                    intensity_technique = IntensityTechnique.find_by(name: ex_json[:intensity_technique])
                    warmup_sets.times do |i|
                      exercise_set = ExerciseSet.find_or_initialize_by(exercise: exercise, order: es_order)
                      exercise_set.assign_attributes(
                        set_type: "Warmup Set",
                        reps: ExerciseSet::WARMUP[warmup_sets - 1][i][:reps],
                        load: 0,
                        unit: load_unit
                      )
                      if exercise_set.save
                        es_order += 1
                      end
                    end
                    working_sets.times do |i|
                      exercise_set = ExerciseSet.find_or_initialize_by(exercise: exercise, order: es_order)
                      rpe = (i == working_sets - 1) ? last_set_rpe : early_sets_rpe
                      technique = (i == working_sets - 1) ? intensity_technique : nil
                      exercise_set.assign_attributes(
                        set_type: "Working Set",
                        reps: exercise.rep_range_max,
                        load: 0,
                        unit: load_unit,
                        intensity: rpe,
                        suggested_intensity: rpe,
                        intensity_technique: technique
                      )
                      if exercise_set.save
                        es_order += 1
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

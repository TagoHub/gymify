# TODO:
# * figure if exercises should have 1 or more instruments
# * complete fully workout 1
# * complete fully program 1

muscle_group_1 = MuscleGroup.create!(name: "Back")
muscle_group_2 = MuscleGroup.create!(name: "Chest")
muscle_group_3 = MuscleGroup.create!(name: "Shoulder")
muscle_group_4 = MuscleGroup.create!(name: "Arm")
muscle_group_5 = MuscleGroup.create!(name: "Core")
muscle_group_6 = MuscleGroup.create!(name: "Quad")
muscle_group_7 = MuscleGroup.create!(name: "Hamstring")
muscle_group_8 = MuscleGroup.create!(name: "Glute")
muscle_group_9 = MuscleGroup.create!(name: "Calf")
puts "Muscle groups created: #{muscle_group_1.name}, #{muscle_group_2.name}, #{muscle_group_3.name}, #{muscle_group_4.name}, #{muscle_group_5.name}, #{muscle_group_6.name}, #{muscle_group_7.name}, #{muscle_group_8.name}, #{muscle_group_9.name}\n"

muscle_1 = muscle_group_1.muscles.create!(name: "Traps")
muscle_2 = muscle_group_1.muscles.create!(name: "Lats" )
muscle_3 = muscle_group_1.muscles.create!(name: "Rhomboids")
muscle_4 = muscle_group_1.muscles.create!(name: "Erector Spinae")
muscle_5 = muscle_group_1.muscles.create!(name: "Teres Major & Minor")
puts "Muscles created for Back: #{muscle_1.name}, #{muscle_2.name}, #{muscle_3.name}, #{muscle_4.name}, #{muscle_5.name}\n"

muscle_6 = muscle_group_2.muscles.create!(name: "Pectoralis Major")
muscle_7 = muscle_group_2.muscles.create!(name: "Pectoralis Minor")
puts "Muscles created for Chest: #{muscle_6.name}, #{muscle_7.name}"

muscle_8 = muscle_group_3.muscles.create!(name: "Anterior Deltoid")
muscle_9 = muscle_group_3.muscles.create!(name: "Lateral Deltoid")
muscle_10 = muscle_group_3.muscles.create!(name: "Posterior Deltoid")
puts "Muscles created for Shoulder: #{muscle_8.name}, #{muscle_9.name}, #{muscle_10.name}\n"

muscle_11 = muscle_group_4.muscles.create!(name: "Biceps Brachii")
muscle_12 = muscle_group_4.muscles.create!(name: "Brachialis")
muscle_13 = muscle_group_4.muscles.create!(name: "Triceps Brachi")
muscle_14 = muscle_group_4.muscles.create!(name: "Forearm Flexors")
muscle_15 = muscle_group_4.muscles.create!(name: "Forearm Extensors")
puts "Muscles created for Arm: #{muscle_11.name}, #{muscle_12.name}, #{muscle_13.name}, #{muscle_14.name}, #{muscle_15.name}\n"

muscle_16 = muscle_group_5.muscles.create!(name: "Rectus Abdominis")
muscle_17 = muscle_group_5.muscles.create!(name: "Obliques")
muscle_18 = muscle_group_5.muscles.create!(name: "Transverse Abdominis")
muscle_19 = muscle_group_5.muscles.create!(name: "Serratus Anterior")
muscle_20 = muscle_group_5.muscles.create!(name: "Spinal Erectors")
puts "Muscles created for Core: #{muscle_16.name}, #{muscle_17.name}, #{muscle_18.name}, #{muscle_19.name}, #{muscle_20.name}\n"

muscle_21 = muscle_group_6.muscles.create!(name: "Rectus Femoris")
muscle_22 = muscle_group_6.muscles.create!(name: "Vastus Lateralis")
muscle_23 = muscle_group_6.muscles.create!(name: "Vastus Medialis")
muscle_24 = muscle_group_6.muscles.create!(name: "Vastus Intermedius")
puts "Muscles created for Quad: #{muscle_21.name}, #{muscle_22.name}, #{muscle_23.name}, #{muscle_24.name}\n"

muscle_25 = muscle_group_7.muscles.create!(name: "Biceps Femoris")
muscle_26 = muscle_group_7.muscles.create!(name: "Semitendinosus")
muscle_27 = muscle_group_7.muscles.create!(name: "Semimembranosus")
puts "Muscles created for Hamstring: #{muscle_25.name}, #{muscle_26.name}, #{muscle_27.name}\n"

muscle_28 = muscle_group_8.muscles.create!(name: "Gluteus Maximus")
muscle_29 = muscle_group_8.muscles.create!(name: "Gluteus Medius")
muscle_30 = muscle_group_8.muscles.create!(name: "Gluteus Minimus")
puts "Muscles created for Glute: #{muscle_28.name}, #{muscle_29.name}, #{muscle_30.name}\n"

muscle_31 = muscle_group_9.muscles.create!(name: "Gastrocnemius")
muscle_32 = muscle_group_9.muscles.create!(name: "Soleus" )
muscle_33 = muscle_group_9.muscles.create!(name: "Tibialis Anterior")
puts "Muscles created for Calf: #{muscle_31.name}, #{muscle_32.name}, #{muscle_33.name}\n"

unit_1 = Unit.create!(name: "Kilograms",   abbreviation: "Kgs",  unit_type: "Weight")
unit_2 = Unit.create!(name: "Pounds",      abbreviation: "Lbs",  unit_type: "Weight")
unit_3 = Unit.create!(name: "Centimeters", abbreviation: "Cms",  unit_type: "Height")
unit_4 = Unit.create!(name: "Feets",       abbreviation: "Fts",  unit_type: "Height")
unit_5 = Unit.create!(name: "Seconds",     abbreviation: "Secs", unit_type: "Time")
unit_6 = Unit.create!(name: "Minutes",     abbreviation: "Mins", unit_type: "Time")
unit_7 = Unit.create!(name: "Hours",       abbreviation: "Hrs",  unit_type: "Time")
puts "Measurement units created: #{unit_1.name}, #{unit_2.name}, #{unit_3.name}, #{unit_4.name}, #{unit_5.name}, #{unit_6.name}, #{unit_7.name}\n"

grip_1 = Grip.create!(name: "Supine Grip")
grip_2 = Grip.create!(name: "Neutral Grip")
grip_3 = Grip.create!(name: "Prone Grip")
puts "Grips created: #{grip_1.name}, #{grip_2.name}, #{grip_3.name}\n"

attachment_1 = Attachment.create!(name: "Rope")
attachment_2 = Attachment.create!(name: "Lat Bar")
attachment_3 = Attachment.create!(name: "Straight Bar")
attachment_4 = Attachment.create!(name: "Row Attachment")
attachment_5 = Attachment.create!(name: "Handle")
attachment_6 = Attachment.create!(name: "Ankle Cuff")
puts "Cable attachments created: #{attachment_1.name}\n"

instrument_1 = Instrument.create!(name: "Barbell", weight: 20, unit: unit_1, grip: grip_3)
instrument_2 = Instrument.create!(name: "EZ Barbell", weight: 10, unit: unit_1, grip: grip_1)
instrument_3 = Instrument.create!(name: "Cable", weight: 0, unit: unit_1, grip: grip_2, attachment: attachment_1)
instrument_4 = Instrument.create!(name: "Body Weight", weight: 75, unit: unit_1)
instrument_5 = Instrument.create!(name: "Adjustable Dumbell", weight: 0, unit: unit_1, grip: grip_1)
instrument_6 = Instrument.create!(name: "Bench", weight: 0, unit: unit_1, grip: grip_3)
instrument_7 = Instrument.create!(name: "Pad", weight: 0, unit: unit_1)
instrument_8 = Instrument.create!(name: "Free Weight", weight: 0, unit: unit_1, grip: grip_2)
instrument_9 = Instrument.create!(name: "Dip Bars", weight: 0, unit: unit_1, grip: grip_2)
instrument_10 = Instrument.create!(name: "Pull-Up Bar", weight: 0, unit: unit_1, grip: grip_3)
puts "Instruments created: #{instrument_1.name}, #{instrument_2.name}, #{instrument_3.name}, #{instrument_4.name}, #{instrument_5.name}, #{instrument_6.name}, #{instrument_7.name}, #{instrument_8.name}\n"

intensity_technique_1 = IntensityTechnique.create(name: "Partial Reps", description: "Partial reps are repetitions that don’t use the entire range of motion (ROM). Lengthened partials are when you do partial reps while the muscle is stretched more")
intensity_technique_2 = IntensityTechnique.create(name: "Drop Set", description: "You are as close to complete failure as you can get. But instead of stopping, you drop the weight back and crank out another 4 or 5 reps")
intensity_technique_3 = IntensityTechnique.create(name: "Myo-Reps", description: "After you take a set to failure, you rest for three to four seconds and then do 4 additional myo-reps. Rest for another three to four seconds, do 4 more myo-reps, and continue the cycle until you can no longer crank out those 4 myo-reps")
intensity_technique_4 = IntensityTechnique.create(name: "Forced Reps", description: "You’re doing a continuous set, usually with the help of a spotter who helps you force your muscles to crank out a few more reps")
intensity_technique_5 = IntensityTechnique.create(name: "Cheat Reps", description: "Picture a person doing an exercise with the same form through 10 reps. But instead of stopping there, they lean their torso back about 5 degrees further and crank out an eleventh rep. They lean forward and then pull back to hit their twelfth. Then they take a big breath and, with the help of a little extra momentum, crank out their thirteenth")
puts "Intensity techniques created: #{intensity_technique_1.name}, #{intensity_technique_2.name}, #{intensity_technique_3.name}, #{intensity_technique_4.name}, #{intensity_technique_5.name}"

user_1 = User.first_or_create!(name: "Santiago Morales", email: "tago470@gmail.com", password: "12345678", gender: "Male", weight: 75, weight_unit: unit_1, height: 185, height_unit: unit_3)
puts "User created: #{user_1.name} (#{user_1.email})\n"

program_1 = user_1.programs.create!(name: "UPPER/LOWER SPLIT 4X/WEEK", frequency: 4, level: "All levels", goal: "Time-limited muscle and strength", duration: 50, unit: unit_6)
puts "Program created: #{program_1.name} (#{program_1.frequency} days/week, #{program_1.level}, #{program_1.goal})\n"

workout_1 = program_1.workouts.create!(name: "Upper #1", goal: "Hipertrophy", rest_days: 0)
workout_2 = program_1.workouts.create!(name: "Lower #1", goal: "Hipertrophy", rest_days: 1)
workout_3 = program_1.workouts.create!(name: "Upper #2", goal: "Hipertrophy", rest_days: 0)
workout_4 = program_1.workouts.create!(name: "Lower #2", goal: "Hipertrophy", rest_days: 2)
puts "Workouts created: #{workout_1.name}, #{workout_2.name}, #{workout_3.name}, #{workout_4.name}\n"

exercise_group_1 = workout_1.exercise_groups.create!(order: 1, superset: false)
exercise_group_2 = workout_1.exercise_groups.create!(order: 2, superset: false)
exercise_group_3 = workout_1.exercise_groups.create!(order: 3, superset: true)
exercise_group_4 = workout_1.exercise_groups.create!(order: 4, superset: false)
exercise_group_5 = workout_1.exercise_groups.create!(order: 5, superset: true)
puts "Exercise groups created: #{exercise_group_1.order}, #{exercise_group_2.order}, #{exercise_group_3.order}, #{exercise_group_4.order}, #{exercise_group_5.order}\n"

exercise_1 = exercise_group_1.exercises.create!(name: "Incline Bench Press", notes: "Include myoreps for final set", exercise_type: "Compound", rep_range_min: 6, rep_range_max: 8, unit: unit_5, rest_time: 180, unilateral: false, instrument: instrument_1)
exercise_2 = exercise_group_2.exercises.create!(name: "Dumbell Row", notes: "", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: unit_5, rest_time: 180, unilateral: true, instrument: instrument_5)
exercise_3 = exercise_group_3.exercises.create!(name: "Dumbell Lateral Raise", notes: "Superset 1", exercise_type: "Isolation", rep_range_min: 12, rep_range_max: 15, unit: unit_5, rest_time: 30, unilateral: false, instrument: instrument_5)
exercise_4 = exercise_group_3.exercises.create!(name: "Lat Pulldown", notes: "Superset 1", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: unit_5, rest_time: 30, unilateral: false, instrument: instrument_3)
exercise_5 = exercise_group_4.exercises.create!(name: "Dumbell Fly", notes: "", exercise_type: "Isolation", rep_range_min: 15, rep_range_max: 20, unit: unit_5, rest_time: 120, unilateral: false, instrument: instrument_5)
exercise_6 = exercise_group_5.exercises.create!(name: "EZ-Bar Biceps Curl", notes: "Superset 2", exercise_type: "Isolation", rep_range_min: 12, rep_range_max: 15, unit: unit_5, rest_time: 30, unilateral: false, instrument: instrument_2)
exercise_7 = exercise_group_5.exercises.create!(name: "Overhead Tricep Extensions", notes: "Superset 2", exercise_type: "Isolation", rep_range_min: 12, rep_range_max: 15, unit: unit_5, rest_time: 30, unilateral: false, instrument: instrument_3)
puts "Exercises created: #{exercise_1.name}, #{exercise_2.name}, #{exercise_3.name}, #{exercise_4.name}, #{exercise_5.name}, #{exercise_6.name}, #{exercise_7.name}\n"

set_1 = exercise_1.exercise_sets.create!(set_type: "Warmup Set", reps: 10, load: 0, unit: unit_2, intensity: nil)
set_2 = exercise_1.exercise_sets.create!(set_type: "Warmup Set", reps: 5, load: 15, unit: unit_2, intensity: nil)
set_3 = exercise_1.exercise_sets.create!(set_type: "Warmup Set", reps: 3, load: 40, unit: unit_2, intensity: nil)
set_4 = exercise_1.exercise_sets.create!(set_type: "Working Set", reps: 4, load: 55, unit: unit_2, intensity: 7)
set_5 = exercise_1.exercise_sets.create!(set_type: "Working Set", reps: 4, load: 55, unit: unit_2, intensity: 8, intensity_technique: intensity_technique_3)
puts "Sets created for Incline Bench Press: #{set_1.set_type}, #{set_2.set_type}, #{set_3.set_type}, #{set_4.set_type}, #{set_5.set_type}\n"

set_6 = exercise_2.exercise_sets.create!(set_type: "Warmup Set", reps: 5, load: 10, unit: unit_1, intensity: nil)
set_7 = exercise_2.exercise_sets.create!(set_type: "Warmup Set", reps: 3, load: 13.5, unit: unit_1, intensity: nil)
set_8 = exercise_2.exercise_sets.create!(set_type: "Working Set", reps: 10, load: 18, unit: unit_1, intensity: 7)
set_9 = exercise_2.exercise_sets.create!(set_type: "Working Set", reps: 10, load: 18, unit: unit_1, intensity: 7)
set_10 = exercise_2.exercise_sets.create!(set_type: "Working Set", reps: 12, load: 18, unit: unit_1, intensity: 9)
puts "Sets created for Dumbell Row: #{set_6.set_type}, #{set_7.set_type}, #{set_8.set_type}, #{set_9.set_type}, #{set_10.set_type}\n"
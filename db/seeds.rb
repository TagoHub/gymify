# Gymify seed

# TODO: 
# * associate grips and muscle groups
# * figure the best way to represent super sets
# * figure if excercises should have 1 or more instruments
# * complete fully workout 1
# * complete fully program 1

# muscle_group_1 = MuscleGroup.create!("name": "Back")
# muscle_group_2 = MuscleGroup.create!("name": "Chest")
# muscle_group_3 = MuscleGroup.create!("name": "Shoulder")
# muscle_group_4 = MuscleGroup.create!("name": "Arm")
# muscle_group_5 = MuscleGroup.create!("name": "Core")
# muscle_group_6 = MuscleGroup.create!("name": "Quad")
# muscle_group_7 = MuscleGroup.create!("name": "Hamstring")
# muscle_group_8 = MuscleGroup.create!("name": "Glute")
# muscle_group_9 = MuscleGroup.create!("name": "Calf")
# 
# 
# muscle_1 = muscle_group_1.muscles.create!("name": "Traps")
# muscle_2 = muscle_group_1.muscles.create!("name": "Lats" )
# muscle_3 = muscle_group_1.muscles.create!("name": "Rhomboids")
# muscle_4 = muscle_group_1.muscles.create!("name": "Erector Spinae")
# muscle_5 = muscle_group_1.muscles.create!("name": "Teres Major & Minor")
# 
# muscle_6 = muscle_group_2.muscles.create!("name": "Pectoralis Major")
# muscle_7 = muscle_group_2.muscles.create!("name": "Pectoralis Minor")
# 
# muscle_8 = muscle_group_3.muscles.create!("name": "Anterior Deltoid")
# muscle_9 = muscle_group_3.muscles.create!("name": "Lateral Deltoid")
# muscle_10 = muscle_group_3.muscles.create!("name": "Posterior Deltoid")
# 
# muscle_11 = muscle_group_4.muscles.create!("name": "Biceps Brachii")
# muscle_12 = muscle_group_4.muscles.create!("name": "Brachialis")
# muscle_13 = muscle_group_4.muscles.create!("name": "Triceps Brachi")
# muscle_14 = muscle_group_4.muscles.create!("name": "Forearm Flexors")
# muscle_15 = muscle_group_4.muscles.create!("name": "Forearm Extensors")
# 
# muscle_16 = muscle_group_5.muscles.create!("name": "Rectus Abdominis")
# muscle_17 = muscle_group_5.muscles.create!("name": "Obliques")
# muscle_18 = muscle_group_5.muscles.create!("name": "Transverse Abdominis")
# muscle_19 = muscle_group_5.muscles.create!("name": "Serratus Anterior")
# muscle_20 = muscle_group_5.muscles.create!("name": "Spinal Erectors")
# 
# muscle_21 = muscle_group_6.muscles.create!("name": "Rectus Femoris")
# muscle_22 = muscle_group_6.muscles.create!("name": "Vastus Lateralis")
# muscle_23 = muscle_group_6.muscles.create!("name": "Vastus Medialis")
# muscle_24 = muscle_group_6.muscles.create!("name": "Vastus Intermedius")
# 
# muscle_25 = muscle_group_7.muscles.create!("name": "Biceps Femoris")
# muscle_26 = muscle_group_7.muscles.create!("name": "Semitendinosus")
# muscle_27 = muscle_group_7.muscles.create!("name": "Semimembranosus")
# 
# muscle_28 = muscle_group_8.muscles.create!("name": "Gluteus Maximus")
# muscle_29 = muscle_group_8.muscles.create!("name": "Gluteus Medius")
# muscle_30 = muscle_group_8.muscles.create!("name": "Gluteus Minimus")
# 
# muscle_31 = muscle_group_9.muscles.create!("name": "Gastrocnemius")
# muscle_32 = muscle_group_9.muscles.create!("name": "Soleus" )
# muscle_33 = muscle_group_9.muscles.create!("name": "Tibialis Anterior")
# 
# instrument_1 = Instrument.create!("name": "Barbell", "weight": 20, "unit": "kg")
# instrument_2 = Instrument.create!("name": "EZ Barbell", "weight": 10, "unit": "kg")
# instrument_3 = Instrument.create!("name": "Cable", "weight": 0, "unit": "kg")
# instrument_4 = Instrument.create!("name": "Body Weight", "weight": 75, "unit": "kg")
# instrument_5 = Instrument.create!("name": "Adjustable Dumbell", "weight": 0, "unit": "kg")
# instrument_6 = Instrument.create!("name": "Bench", "weight": 0, "unit": "kg")
# instrument_7 = Instrument.create!("name": "Pad", "weight": 0, "unit": "kg")
# instrument_8 = Instrument.create!("name": "Free Weigth", "weight": 0, "unit": "kg")
# 
# grip_1 = instrument_3.grips.create!("name": "Rope")
# grip_2 = instrument_3.grips.create!("name": "Lat Bar")
# grip_3 = instrument_3.grips.create!("name": "Straight Bar")
# grip_4 = instrument_3.grips.create!("name": "Row Attachment")
# grip_5 = instrument_3.grips.create!("name": "Handle")
# grip_6 = instrument_3.grips.create!("name": "Ankle Cuff")
# grip_7 = instrument_3.grips.create!("name": "None")
# 
user_1 = User.create!("name": "Santiago Morales", "email": "tago470@gmail.com", "password": "12345678", "gender": "Male", "weight": 75, "weight_unit": "kg", "height": 185, "height_unit": "cm")
puts "User created: #{user_1.name} (#{user_1.email})"
# 
# program_1 = user_1.programs.create!("name": "UPPER/LOWER SPLIT 4X/WEEK", "frequency": 4, "level": "All levels", "goal": "Time-limited muscle and strength", "min_time": 45, "max_time": 60)
# 
# workout_1 = program_1.workouts.create!("name": "Upper #1", "goal": "Hipertrophy", "rest_days": 0)
# workout_2 = program_1.workouts.create!("name": "Lower #1", "goal": "Hipertrophy", "rest_days": 1)
# workout_3 = program_1.workouts.create!("name": "Upper #2", "goal": "Hipertrophy", "rest_days": 0)
# workout_4 = program_1.workouts.create!("name": "Lower #2", "goal": "Hipertrophy", "rest_days": 2)
# 
# excercise_1 = workout_1.excercises.create!("name": "Incline Bench Press", "notes": "Include myoreps for final set", "type": "Compound", "min_reps": 6, "max_reps": 8, "rest_time": 3, "unilateral": false, instrument: instrument_1)
# excercise_2 = workout_1.excercises.create!("name": "Dumbell Row", "notes": "", "type": "Compound", "min_reps": 8, "max_reps": 10, "rest_time": 3, "unilateral": true, instrument: instrument_5)
# excercise_3 = workout_1.excercises.create!("name": "Dumbell Lateral Raise", "notes": "Superset 1", "type": "Isolation", "min_reps": 12, "max_reps": 15, "rest_time": 0.5, "unilateral": false, instrument: instrument_5)
# excercise_4 = workout_1.excercises.create!("name": "Lat Pulldown", "notes": "Superset 1", "type": "Compound", "min_reps": 8, "max_reps": 10, "rest_time": 0.5, "unilateral": false, instrument: instrument_3)
# excercise_5 = workout_1.excercises.create!("name": "Dumbell Fly", "notes": "", "type": "Isolation", "min_reps": 15, "max_reps": 20, "rest_time": 2, "unilateral": false, instrument: instrument_5)
# excercise_6 = workout_1.excercises.create!("name": "EZ-Bar Biceps Curl", "notes": "Superset 2", "type": "Isolation", "min_reps": 12, "max_reps": 15, "rest_time": 0.5, "unilateral": false, instrument: instrument_2)
# excercise_7 = workout_1.excercises.create!("name": "Overhead Tricep Extensions", "notes": "Superset 2", "type": "Isolation", "min_reps": 12, "max_reps": 15, "rest_time": 0.5, "unilateral": false, instrument: instrument_3)
# 
# set_1 = excercise_1.sets.create!("type": "Warmup Set", "reps": 10, "load": 0, "unit": "lb", "intensity": nil, "intensity_technique": nil)
# set_2 = excercise_1.sets.create!("type": "Warmup Set", "reps": 5, "load": 15, "unit": "lb", "intensity": nil, "intensity_technique": nil)
# set_3 = excercise_1.sets.create!("type": "Warmup Set", "reps": 3, "load": 40, "unit": "lb", "intensity": nil, "intensity_technique": nil)
# set_4 = excercise_1.sets.create!("type": "Working Set", "reps": 4, "load": 55, "unit": "lb", "intensity": 7, "intensity_technique": nil)
# set_5 = excercise_1.sets.create!("type": "Working Set", "reps": 4, "load": 55, "unit": "lb", "intensity": 8, "intensity_technique": "Myoreps")
# 
# set_6 = excercise_2.sets.create!("type": "Warmup Set", "reps": 5, "load": 10, "unit": "kg", "intensity": nil, "intensity_technique": nil)
# set_7 = excercise_2.sets.create!("type": "Warmup Set", "reps": 3, "load": 13.5, "unit": "kg", "intensity": nil, "intensity_technique": nil)
# set_8 = excercise_2.sets.create!("type": "Working Set", "reps": 10, "load": 18, "unit": "kg", "intensity": 7, "intensity_technique": nil)
# set_9 = excercise_2.sets.create!("type": "Working Set", "reps": 10, "load": 18, "unit": "kg", "intensity": 7, "intensity_technique": nil)
# set_10 = excercise_2.sets.create!("type": "Working Set", "reps": 12, "load": 18, "unit": "kg", "intensity": 9, "intensity_technique": nil)
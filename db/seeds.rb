# TODO:
# * figure if exercises should have 1 or more instruments
# * complete fully workout 1
# * complete fully program 1

legs      = MuscleGroup.find_or_create_by!(name: "Legs", template: true)
core      = MuscleGroup.find_or_create_by!(name: "Core", template: true)
chest     = MuscleGroup.find_or_create_by!(name: "Chest", template: true)
back      = MuscleGroup.find_or_create_by!(name: "Back", template: true)
arms      = MuscleGroup.find_or_create_by!(name: "Arms", template: true)
shoulders = MuscleGroup.find_or_create_by!(name: "Shoulders", template: true)
neck      = MuscleGroup.find_or_create_by!(name: "Neck", template: true)
puts("Muscle Groups")

quadriceps           =      legs.muscles.find_or_create_by!(name: "Quadriceps")
hamstrings           =      legs.muscles.find_or_create_by!(name: "Hamstrings")
glutes               =      legs.muscles.find_or_create_by!(name: "Glutes")
calves               =      legs.muscles.find_or_create_by!(name: "Calves")
adductors            =      legs.muscles.find_or_create_by!(name: "Adductors")
hip_flexors          =      legs.muscles.find_or_create_by!(name: "Hip Flexors")
spinal_erectors      =      back.muscles.find_or_create_by!(name: "Spinal Erectors")
lats                 =      back.muscles.find_or_create_by!(name: "Lats" )
traps                =      back.muscles.find_or_create_by!(name: "Traps")
rhomboids            =      back.muscles.find_or_create_by!(name: "Rhomboids")
biceps               =      arms.muscles.find_or_create_by!(name: "Biceps")
triceps              =      arms.muscles.find_or_create_by!(name: "Triceps")
forearms             =      arms.muscles.find_or_create_by!(name: "Forearms")
wrist_flexors        =      arms.muscles.find_or_create_by!(name: "Wrist Flexors")
wrist_extensors      =      arms.muscles.find_or_create_by!(name: "Wrist Extensors")
rear_delts           = shoulders.muscles.find_or_create_by!(name: "Posterior Deltoids")
front_delts          = shoulders.muscles.find_or_create_by!(name: "Anterior Deltoids")
side_delts           = shoulders.muscles.find_or_create_by!(name: "Lateral Deltoid")
shoulder_stabilizers = shoulders.muscles.find_or_create_by!(name: "Shoulder Stabilizers")
rotator_cuff         = shoulders.muscles.find_or_create_by!(name: "Rotator Cuff")
pecs                 =     chest.muscles.find_or_create_by!(name: "Pectorals")
upper_pecs           =     chest.muscles.find_or_create_by!(name: "Upper Pectorals")
lower_pecs           =     chest.muscles.find_or_create_by!(name: "Lower Pectorals")
levator_scapulae     =      neck.muscles.find_or_create_by!(name: "Levator Scapulae")
neck_flexors         =      neck.muscles.find_or_create_by!(name: "Neck Flexors")
neck_extensors       =      neck.muscles.find_or_create_by!(name: "Neck Extensors")
abs                  =      core.muscles.find_or_create_by!(name: "Abdominals")
obliques             =      core.muscles.find_or_create_by!(name: "Obliques")
puts("Muscles")

kilograms   = Unit.find_or_create_by!(name: "Kilograms",   abbreviation: "Kgs",  unit_type: "Weight")
pounds      = Unit.find_or_create_by!(name: "Pounds",      abbreviation: "Lbs",  unit_type: "Weight")
centimeters = Unit.find_or_create_by!(name: "Centimeters", abbreviation: "Cms",  unit_type: "Height")
feets       = Unit.find_or_create_by!(name: "Feets",       abbreviation: "Fts",  unit_type: "Height")
seconds     = Unit.find_or_create_by!(name: "Seconds",     abbreviation: "Secs", unit_type: "Time")
minutes     = Unit.find_or_create_by!(name: "Minutes",     abbreviation: "Mins", unit_type: "Time")
hours       = Unit.find_or_create_by!(name: "Hours",       abbreviation: "Hrs",  unit_type: "Time")
puts("Units")

supine_grip  = Grip.find_or_create_by!(name: "Supine Grip")
neutral_grip = Grip.find_or_create_by!(name: "Neutral Grip")
prone_grip   = Grip.find_or_create_by!(name: "Prone Grip")
puts("Grips")

rope_attachment         = Attachment.find_or_create_by!(name: "Rope")
lat_bar_attachment      = Attachment.find_or_create_by!(name: "Lat Bar")
straight_bar_attachment = Attachment.find_or_create_by!(name: "Straight Bar")
row_attachment          = Attachment.find_or_create_by!(name: "Row Attachment")
handle_attachment       = Attachment.find_or_create_by!(name: "Handle")
ankle_cuff_attachment   = Attachment.find_or_create_by!(name: "Ankle Cuff")
puts("Attachments")

barbell     = Instrument.find_or_create_by!(name: "Barbell",     weight: 20, unit: kilograms)
ez_bar      = Instrument.find_or_create_by!(name: "EZ Bar",      weight: 10, unit: kilograms)
cable       = Instrument.find_or_create_by!(name: "Cable",       weight: 0,  unit: kilograms)
body_weight = Instrument.find_or_create_by!(name: "Body Weight", weight: 0,  unit: kilograms)
dumbbell    = Instrument.find_or_create_by!(name: "Dumbbell",    weight: 0,  unit: kilograms)
free_weight = Instrument.find_or_create_by!(name: "Free Weight", weight: 0,  unit: kilograms)
dip_bars    = Instrument.find_or_create_by!(name: "Dip Bars",    weight: 0,  unit: kilograms)
pull_up_bar = Instrument.find_or_create_by!(name: "Pull-Up Bar", weight: 0,  unit: kilograms)
machine     = Instrument.find_or_create_by!(name: "Machine",     weight: 0,  unit: kilograms)
puts("Instruments")

partial_reps = IntensityTechnique.find_or_create_by!(name: "Partial Reps", description: "Partial reps are repetitions that don’t use the entire range of motion (ROM). Lengthened partials are when you do partial reps while the muscle is stretched more")
drop_set     = IntensityTechnique.find_or_create_by!(name: "Drop Set",     description: "You are as close to complete failure as you can get. But instead of stopping, you drop the weight back and crank out another 4 or 5 reps")
myo_reps     = IntensityTechnique.find_or_create_by!(name: "Myo-Reps",     description: "After you take a set to failure, you rest for three to four seconds and then do 4 additional myo-reps. Rest for another three to four seconds, do 4 more myo-reps, and continue the cycle until you can no longer crank out those 4 myo-reps")
forced_reps  = IntensityTechnique.find_or_create_by!(name: "Forced Reps",  description: "You’re doing a continuous set, usually with the help of a spotter who helps you force your muscles to crank out a few more reps")
cheat_reps   = IntensityTechnique.find_or_create_by!(name: "Cheat Reps",   description: "Picture a person doing an exercise with the same form through 10 reps. But instead of stopping there, they lean their torso back about 5 degrees further and crank out an eleventh rep. They lean forward and then pull back to hit their twelfth. Then they take a big breath and, with the help of a little extra momentum, crank out their thirteenth")
puts("Techniques")

template_user = User.find_or_create_by!(name: "Templates Administrator", email: "templates@gymify.com")
template_program = template_user.programs.find_or_create_by!(name: "All Exercises Program")
template_workout = template_program.workouts.find_or_create_by!(name: "All Exercises Workout")
template_group = template_workout.exercise_groups.find_or_create_by!(order: 1, superset: false)
puts("Exercise Group")

# QUADS
ex = template_group.exercises.find_or_create_by!(name: "Barbell Back Squat", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes, spinal_erectors, adductors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Barbell Front Squat", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes, spinal_erectors, adductors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Goblet Squat", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes, spinal_erectors, adductors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Barbell Lunge", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbell Lunge", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: true, instrument: dumbbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Leg Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Leg Extension", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps]
ex.save!
# GLUTES
ex = template_group.exercises.find_or_create_by!(name: "Deadlift", exercise_type: "Compound", rep_range_min: 6, rep_range_max: 8, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes, spinal_erectors, hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Sumo Deadlift", exercise_type: "Compound", rep_range_min: 6, rep_range_max: 8, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [quadriceps, glutes, spinal_erectors, hamstrings, adductors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Hip Thrust", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "45° Back Extension", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes, spinal_erectors, hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Hip Abduction", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Hip Adduction", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [adductors]
ex.save!
# HAMSTRINGS
ex = template_group.exercises.find_or_create_by!(name: "Romanian Deadlift", exercise_type: "Compound", rep_range_min: 6, rep_range_max: 8, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes, spinal_erectors, hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Good Morning", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes, spinal_erectors, hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Lying Leg Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Seated Leg Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Glute-Ham Raise", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: machine, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes, hamstrings]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Nordic Ham Curl", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: body_weight, body_weight: true, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [glutes, hamstrings]
ex.save!
# CALF
ex = template_group.exercises.find_or_create_by!(name: "Standing Calf Raise", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [calves]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Seated Calf Raise", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: legs.id)
ex.muscles = [calves]
ex.save!
# BACK
ex = template_group.exercises.find_or_create_by!(name: "Pull Up", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: pull_up_bar, body_weight: true, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, forearms, biceps, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Pull Up", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, forearms, biceps, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Chin Up", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: pull_up_bar, body_weight: true, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Lat Pull Down", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Barbell Row", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, forearms, biceps, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Pendlay Row", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, forearms, biceps, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Row", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: true, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "T-Bar Row", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, traps, rhomboids, rear_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Straight-Arm Lat Pullover", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Lat Pull-In", exercise_type: "isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: true, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: back.id)
ex.muscles = [lats]
ex.save!
# CHEST
ex = template_group.exercises.find_or_create_by!(name: "Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Close Grip Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Incline Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [upper_pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Decline Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [lower_pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Incline Bench Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [upper_pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dips", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: dip_bars, body_weight: true, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [lower_pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Dips", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [lower_pecs, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Fly", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Fly", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, front_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Pec Deck", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, front_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Push Up", exercise_type: "Compound", rep_range_min: 10, rep_range_max: 30, unit: seconds, rest_time: 180, unilateral: false, instrument: body_weight, body_weight: true, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, triceps, front_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Push Up", exercise_type: "Compound", rep_range_min: 10, rep_range_max: 30, unit: seconds, rest_time: 180, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: chest.id)
ex.muscles = [pecs, triceps, front_delts]
ex.save!
# SHOULDERS
ex = template_group.exercises.find_or_create_by!(name: "Barbell Overhead Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [upper_pecs, side_delts, front_delts, triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Standing Shoulder Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts, front_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Seated Shoulder Press", exercise_type: "Compound", rep_range_min: 8, rep_range_max: 10, unit: seconds, rest_time: 180, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts, front_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Lateral Raise", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts, traps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Lateral Raise", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: true, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Barbell Upright Row", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts, traps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Upright Row", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [side_delts, traps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Reverse Fly", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [rear_delts, rhomboids, traps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Reverse Pec Deck", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: machine, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [rear_delts, rhomboids, traps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Rope Face Pull", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 15, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: shoulders.id)
ex.muscles = [rear_delts, rhomboids, traps, rotator_cuff]
ex.save!
# BICEPS
ex = template_group.exercises.find_or_create_by!(name: "Barbell Standing Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "EZ Bar Standing Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: ez_bar, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Standing Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Incline Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Bayesian Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: true, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Hammer Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Preacher Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: ez_bar, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [biceps]
ex.save!
# TRICEPS
ex = template_group.exercises.find_or_create_by!(name: "Skull Crushers", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: ez_bar, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Overhead Triceps Extension", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Seated Overhead Triceps Extension", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Triceps Pressdown", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [triceps]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Cable Triceps Kickback", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: true, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [triceps]
ex.save!
# FOREARMS
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Wrist Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: true, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [forearms, wrist_flexors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Wrist Extension", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: true, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: arms.id)
ex.muscles = [forearms, wrist_extensors]
ex.save!
# UPPER TRAP AND NECK
ex = template_group.exercises.find_or_create_by!(name: "Barbell Shrug", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: barbell, body_weight: false, template: true, primary_muscle_group_id: neck.id)
ex.muscles = [traps, levator_scapulae]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Dumbbell Shrug", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: dumbbell, body_weight: false, template: true, primary_muscle_group_id: neck.id)
ex.muscles = [traps, levator_scapulae]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Neck Curl", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: free_weight, body_weight: false, template: true, primary_muscle_group_id: neck.id)
ex.muscles = [neck_flexors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Neck Extension", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: free_weight, body_weight: false, template: true, primary_muscle_group_id: neck.id)
ex.muscles = [neck_extensors, traps]
ex.save!
# CORE
ex = template_group.exercises.find_or_create_by!(name: "Cable Crunch", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: cable, body_weight: false, template: true, primary_muscle_group_id: core.id)
ex.muscles = [abs]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Weighted Decline Sit Up", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 12, unit: seconds, rest_time: 120, unilateral: false, instrument: free_weight, body_weight: true, template: true, primary_muscle_group_id: core.id)
ex.muscles = [abs, hip_flexors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Hanging Leg Raise", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 20, unit: seconds, rest_time: 120, unilateral: false, instrument: body_weight, body_weight: true, template: true, primary_muscle_group_id: core.id)
ex.muscles = [abs, hip_flexors]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Plank", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 10, unit: seconds, rest_time: 120, unilateral: false, instrument: body_weight, body_weight: true, template: true, primary_muscle_group_id: core.id)
ex.muscles = [abs, obliques]
ex.save!
ex = template_group.exercises.find_or_create_by!(name: "Long Lever Pelvic Tilt Plank", exercise_type: "Isolation", rep_range_min: 10, rep_range_max: 10, unit: seconds, rest_time: 120, unilateral: false, instrument: body_weight, body_weight: true, template: true, primary_muscle_group_id: core.id)
ex.muscles = [abs, obliques, shoulder_stabilizers]
ex.save!
puts("Exercises")

def attach_image_if_present(exercise, image_name)
  path = Rails.root.join("app/assets/images/exercises/#{image_name}")
  if File.exist?(path)
    exercise.image.attach(io: File.open(path), filename: image_name, content_type: "image/jpeg")
  end
end

["jpg", "webp", "png", "avif", "jpeg"].each{|f| Exercise.where(template: true).each{|e| attach_image_if_present(e, [e.name, f].join("."))}}
// WorkoutRoutineView.swift

import SwiftUI

struct WorkoutRoutineView: View {
    @State private var numberOfDays = 3
    @State private var goal = 0
    @State private var routine = [String]()
    @State private var showingRoutine = false
    
    private let goals = ["Hypertrophy", "Strength"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of Days")) {
                    Picker("Days per Week", selection: $numberOfDays) {
                        ForEach(3...6, id: \.self) { day in
                            Text("\(day) days")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Goal")) {
                    Picker("Workout Goal", selection: $goal) {
                        ForEach(0..<goals.count, id: \.self) { index in
                            Text(self.goals[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Button(action: generateWorkoutRoutine) {
                    Text("Generate Workout Routine")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Routine Creator")
            .sheet(isPresented: $showingRoutine) {
                RoutineResultView(routine: $routine)
            }


        }
    }
    
    private func generateWorkoutRoutine() {
        let selectedGoal = goals[goal]

        switch numberOfDays {
        case 3:
            routine = selectedGoal == "Hypertrophy" ? hypertrophy3DayRoutine() : strength3DayRoutine()
        case 4:
            routine = selectedGoal == "Hypertrophy" ? hypertrophy4DayRoutine() : strength4DayRoutine()
        case 5:
            routine = selectedGoal == "Hypertrophy" ? hypertrophy5DayRoutine() : strength5DayRoutine()
        case 6:
            routine = selectedGoal == "Hypertrophy" ? hypertrophy6DayRoutine() : strength6DayRoutine()
        default:
            routine = ["Invalid number of days."]
        }
        
        showingRoutine = true
    }

    private func hypertrophy3DayRoutine() -> [String] {
        return [
            "Day 1 (Hypertrophy):",
            "- Squat 3x10",
            "- Bench Press 3x10",
            "- Deadlift 3x10",
            "- Pull-ups 3x10",
            "",
            "Day 2 (Hypertrophy):",
            "- Leg Press 3x10",
            "- Incline Bench Press 3x10",
            "- Rows 3x10",
            "- Shoulder Press 3x10",
            "",
            "Day 3 (Hypertrophy):",
            "- Front Squat 3x10",
            "- Dips 3x10",
            "- Romanian Deadlift 3x10",
            "- Chin-ups 3x10"
        ]
    }

    private func strength3DayRoutine() -> [String] {
        return [
            "Day 1 (Strength):",
            "- Squat 3x5",
            "- Bench Press 3x5",
            "- Deadlift 3x5",
            "- Pull-ups 3x5",
            "",
            "Day 2 (Strength):",
            "- Leg Press 3x8",
            "- Incline Bench Press 3x8",
            "- Rows 3x8",
            "- Shoulder Press 3x8",
            "",
            "Day 3 (Strength):",
            "- Front Squat 3x6",
            "- Dips 3x6",
            "- Romanian Deadlift 3x6",
            "- Chin-ups 3x6"
        ]
    }

    private func hypertrophy4DayRoutine() -> [String] {
        return [
            "Day 1 (Hypertrophy):",
            "- Chest and Triceps:",
            "  - Bench Press 4x8",
            "  - Incline Dumbbell Press 4x10",
            "  - Cable Flys 3x12",
            "  - Tricep Pushdowns 3x12",
            "",
            "Day 2 (Hypertrophy):",
            "- Back and Biceps:",
            "  - Lat Pulldowns 4x10",
            "  - Barbell Rows 4x8",
            "  - Dumbbell Curls 3x12",
            "  - Hammer Curls 3x12",
            "",
            "Day 3 (Hypertrophy):",
            "- Legs and Shoulders:",
            "  - Squats 4x8",
            "  - Romanian Deadlifts 4x10",
            "  - Leg Press 3x12",
            "  - Shoulder Press 3x10",
            "",
            "Day 4 (Hypertrophy):",
            "- Chest and Arms:",
            "  - Incline Bench Press 4x8",
            "  - Dips 4x10",
            "  - Skull Crushers 3x12",
            "  - Close Grip Bench Press 3x12"
        ]
    }


    private func strength4DayRoutine() -> [String] {
        return [
            "Day 1 (Strength):",
            "- Squats 3 x 3-5 at 80-85% of 1RM",
            "- RDL 3 x 3-5 at 80-85% of 1RM",
            "- Pull-ups 3 x 3-5 at 80-85% of 1RM",
            "",
            "Day 2 (Strength):",
            "- Bench Press 3 x 3-5 at 80-85% of 1RM",
            "- Dumbbell Rows 3 x 3-5 at 80-85% of 1RM:",
            "- OHP 3 x 3-5 at 80-85% of 1RM",
            "",
            "Day 3 (Strength):",
            "- Deadlifts 3 x 3-5 at 80-85% of 1RM",
            "- Leg Press 3 x 3-5 at 80-85% of 1RM",
            "- Calf Raises 3 x 3-5 at 80-85% of 1RM",
            "",
            "Day 4 (Strength):",
            "- Incline Bench Press 3 x 3-5 at 80-85% of 1RM",
            "- Barbell Rows 3 x 3-5 at 80-85% of 1RM",
            "- Dips 3 x 3-5 ",
            "- Barbell Curls 3 x 3-5 at 80-85% of 1RM",
        ]
    }

    private func hypertrophy5DayRoutine() -> [String] {
        return [
            "Day 1 (Hypertrophy):",
            "- Chest and Triceps:",
            "  - Bench Press 4x8",
            "  - Incline Dumbbell Press 4x10",
            "  - Cable Flys 3x12",
            "  - Tricep Pushdowns 3x12",
            "",
            "Day 2 (Hypertrophy):",
            "- Back and Biceps:",
            "  - Lat Pulldowns 4x10",
            "  - Barbell Rows 4x8",
            "  - Dumbbell Curls 3x12",
            "  - Hammer Curls 3x12",
            "",
            "Day 3 (Hypertrophy):",
            "- Legs:",
            "  - Squats 4x8",
            "  - Romanian Deadlifts 4x10",
            "  - Leg Press 3x12",
            "  - Calf Raises 3x15",
            "",
            "Day 4 (Hypertrophy):",
            "- Shoulders and Traps:",
            "  - Shoulder Press 4x8",
            "  - Dumbbell Lateral Raises 3x12",
            "  - Upright Rows 3x12",
            "  - Shrugs 3x15",
            "",
            "Day 5 (Hypertrophy):",
            "- Arms:",
            "  - Skull Crushers 3x10",
            "  - Close Grip Bench Press 3x10",
            "  - Preacher Curls 3x10",
            "  - Hammer Curls 3x10"
        ]
    }


    private func strength5DayRoutine() -> [String] {
        return [
            "Day 1 (Strength):",
            "- Squats:",
            "  - 3 sets of 3-5 reps at 85-90% of 1RM",
            "",
            "- Romanian Deadlifts:",
            "  - 3 sets of 3-5 reps at 85-90% of 1RM",
            "",
            "- Pull-ups:",
            "  - 3 sets of 3-5 reps",
            "",
            "Day 2 (Strength):",
            "- Bench Press:",
            "  - 3 sets of 3-5 reps at 85-90% of 1RM",
            "",
            "- Barbell Rows:",
            "  - 3 sets of 3-5 reps",
            "",
            "Day 3 (Strength):",
            "- Deadlifts:",
            "  - 3 sets of 3-5 reps at 85-90% of 1RM",
            "",
            "- Leg Press:",
            "  - 3 sets of 3-5 reps",
            "",
            "Day 4 (Strength):",
            "- Overhead Press:",
            "  - 3 sets of 3-5 reps at 85-90% of 1RM",
            "",
            "- Chin-ups:",
            "  - 3 sets of 3-5 reps",
            "",
            "Day 5 (Strength):",
            "- Barbell Curls:",
            "  - 3 sets of 3-5 reps",
            "",
            "- Tricep Dips:",
            "  - 3 sets of 3-5 reps"
        ]
    }


    private func hypertrophy6DayRoutine() -> [String] {
        return [
            "Day 1 (Hypertrophy):",
            "- Chest:",
            "  - Bench Press 4x8",
            "  - Incline Dumbbell Press 4x10",
            "  - Dumbbell Flys 3x12",
            "",
            "Day 2 (Hypertrophy):",
            "- Back:",
            "  - Lat Pulldowns 4x10",
            "  - Bent Over Rows 4x8",
            "  - Cable Rows 3x12",
            "",
            "Day 3 (Hypertrophy):",
            "- Legs:",
            "  - Squats 4x8",
            "  - Leg Press 4x10",
            "  - Romanian Deadlifts 3x12",
            "",
            "Day 4 (Hypertrophy):",
            "- Shoulders:",
            "  - Overhead Press 4x8",
            "  - Lateral Raises 3x12",
            "  - Front Raises 3x12",
            "",
            "Day 5 (Hypertrophy):",
            "- Arms:",
            "  - Bicep Curls 3x10",
            "  - Tricep Dips 3x10",
            "  - Hammer Curls 3x10",
            "  - Skull Crushers 3x10",
            "",
            "Day 6 (Hypertrophy):",
            "- Legs:",
            "  - Lunges 3x10",
            "  - Leg Extensions 3x12",
            "  - Calf Raises 3x15"
        ]
    }

    private func strength6DayRoutine() -> [String] {
        return [
            "Day 1 (Strength):",
            "- Squats:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Romanian Deadlifts:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Pull-ups:",
            "  - 4 sets of 5 reps",
            "",
            "Day 2 (Strength):",
            "- Bench Press:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Barbell Rows:",
            "  - 4 sets of 5 reps",
            "",
            "Day 3 (Strength):",
            "- Deadlifts:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Leg Press:",
            "  - 4 sets of 5 reps",
            "",
            "Day 4 (Strength):",
            "- Overhead Press:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Chin-ups:",
            "  - 4 sets of 5 reps",
            "",
            "Day 5 (Strength):",
            "- Barbell Curls:",
            "  - 4 sets of 5 reps",
            "",
            "- Tricep Dips:",
            "  - 4 sets of 5 reps",
            "",
            "Day 6 (Strength):",
            "- Front Squats:",
            "  - 4 sets of 5 reps at 80-85% of 1RM",
            "",
            "- Weighted Lunges:",
            "  - 4 sets of 5 reps"
        ]
    }


}

struct RoutineResultView: View {
    @Binding var routine: [String]
    @Environment(\.dismiss) var dismiss

    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(routine, id: \.self) { day in
                    Text(day)
                }
            }
            .navigationBarTitle("Your Workout Routine")
            .navigationBarItems(trailing: Button("Done") {
                routine = []
                dismiss()
            })
        }
    }
}

struct WorkoutRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRoutineView()
    }
}

// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("GymInOne")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                NavigationLink(destination: FirstView()) {
                    Text("BMI calculator")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: RPECalculatorView()) {
                    Text("RPE calculator")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                NavigationLink(destination: WorkoutRoutineView()) {
                    Text("Workout Routine Creator")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                NavigationLink(destination: progesstracker()) {
                    Text("Progress Tracker")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct FirstView: View {
    @State private var weight = ""
    @State private var height = ""
    @State private var showingBMIResult = false
    @State private var bmiResult = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Weight (kg)", text: $weight)
                    .padding()
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Height (cm)", text: $height)
                    .padding()
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: calculateBMI) {
                    Text("Calculate BMI")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("BMI Calculator")
            .alert(isPresented: $showingBMIResult) {
                Alert(title: Text("BMI Result"),
                      message: Text(bmiResult),
                      dismissButton: .default(Text("OK")))
            }
        }
    }

    private func calculateBMI() {
        guard let weightValue = Double(weight), let heightValue = Double(height) else {
            return
        }

        let heightInMeters = heightValue / 100
        let bmi = weightValue / (heightInMeters * heightInMeters)
        bmiResult = String(format: "Your BMI is: %.2f", bmi)
        showingBMIResult = true
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

import SwiftUI

struct RPECalculatorView: View {
    @State private var reps = ""
    @State private var sets = ""
    @State private var rpe = ""
    
    var body: some View {
        VStack {
            TextField("Weight", text: $sets)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Reps", text: $reps)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("RPE (1-10)", text: $rpe)
                .padding()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: calculateOneRepMax) {
                Text("Calculate 1RM")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle("RPE Calculator", displayMode: .inline)
    }

    private func calculateOneRepMax() {
        guard let setsValue = Int(sets), let repsValue = Int(reps), let rpeValue = Double(rpe) else {
            return
        }
        
        // Example calculation using the Epley formula
        let oneRepMax = (setsValue * repsValue * Int(rpeValue)) / 30 + setsValue
        
        UIApplication.shared.windows.first?.rootViewController?.present(alertController(oneRepMax: Double(oneRepMax)), animated: true, completion: nil)
    }
    
    private func alertController(oneRepMax: Double) -> UIAlertController {
        let alertController = UIAlertController(title: "1RM Result", message: String(format: "Your estimated 1RM is: %.2f", oneRepMax), preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertController
    }
}

struct RPECalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        RPECalculatorView()
    }
}

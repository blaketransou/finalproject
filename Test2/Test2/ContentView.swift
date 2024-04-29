//
//  ContentView.swift
//  Test2
//
//  Created by Transou, Blake M on 4/10/24.
//

import SwiftUI



struct ContentView: View {
    // Pet types
    let petTypes = ["Dog", "Cat", "Bird", "Fish", "Rabbit"]
        
    // Dictionary to store pet names
    let petNames: [String: [String]] = [
        "Dog": ["Max", "Buddy", "Charlie", "Bailey", "Cooper"],
        "Cat": ["Luna", "Bella", "Simba", "Oliver", "Milo"],
        "Bird": ["Kiwi", "Peanut", "Sunny", "Buddy", "Sky"],
        "Fish": ["Bubbles", "Nemo", "Splash", "Finley", "Goldie"],
        "Rabbit": ["Bunny", "Cotton", "Thumper", "Hopper", "Snowball"]
    ]
    
    @State private var selectedPetIndex = 0
    @State private var generatedName = ""
    
    var body: some View {
        VStack {
            Text ("Welcome!")
                .bold() // Make the text bold
                .font(.system(size: 40)) // Adjust size as needed
            
            Image("pets")
                         .resizable()
                         .frame(width: 500, height: 300) // Adjust size as needed
                         .padding(.top, 20) // Add padding to position the image
                    
                    Text("Pet Name Generator")
                        .font(.largeTitle)
            
                        .bold() // Make the text bold
            Text("Pick the type of pet below, then click Generate Pet Name.")
                .multilineTextAlignment(.center) // Align text to center
                .font(.custom("Arial", size: 17))
           
                    Picker(selection: $selectedPetIndex, label: Text("Select a pet")) {
                        ForEach(0..<petTypes.count) { index in
                            Text(self.petTypes[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Button(action: {
                        self.generateName()
                    }) {
                        Text("Generate Pet Name")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(30)
                            .font(.custom("Arial", size: 20))
                    }
                    
                    Text(generatedName)
                        .font(.largeTitle)
                        .padding()
                
                }
        }
    
    func generateName() {
        let selectedPetType = petTypes[selectedPetIndex]
        if let names = petNames[selectedPetType] {
            generatedName = names.randomElement() ?? "No name found"
        } else {
            generatedName = "No name found"
               }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  tipsView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct Tip: Identifiable {
    var id: Int
    var text: String
    var imageName: String
    var color: Color // Add color property
}

class TipsStore: ObservableObject {
    @Published var tips: [Tip]

    // Initialize with plant tips and corresponding colors
    init() {
        tips = [
            Tip(id: 0, text: "Water your plants regularly but avoid overwatering.", imageName: "drop.fill", color: Color("light_tree")),
            Tip(id: 1, text: "Ensure your plants get enough sunlight; some plants prefer indirect light.", imageName: "sun.max.fill", color: Color("leaf")),
            Tip(id: 2, text: "Use the right type of soil for your plants to thrive.", imageName: "laurel.trailing", color: Color("dark_trq")),
            Tip(id: 3, text: "Fertilize during the growing season for better growth.", imageName: "leaf.fill", color: Color.green),
            Tip(id: 4, text: "Prune dead or yellowing leaves to encourage new growth.", imageName: "scissors", color: Color("tree")),
            Tip(id: 5, text: "Keep an eye out for pests and treat them promptly.", imageName: "ladybug", color: Color("yell_green")),
            Tip(id: 6, text: "Repot your plants every couple of years to provide fresh nutrients.", imageName: "leaf.arrow.triangle.circlepath", color: Color("yell"))
        ]
    }
}

struct TipsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var store = TipsStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State private var activeIndex: Int = 0

    var body: some View {
        VStack {
            // Navigation title
            VStack(alignment: .leading) {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Divider below the title
                Divider()
                    .background(Color.gray)
            }
           // .padding(.horizontal)

            // Image at the top
            Image("watering_pot") // Ensure this image is in your asset catalog
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150) // Adjust size as needed
                .padding(.top)

           
                .padding()
            
            ZStack {
                ForEach(store.tips) { tip in
                    // Tip view
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(tip.color) // Set card color to the specific tip's color
                        VStack {
                            Image(systemName: tip.imageName) // Tip icon
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.top)
                            Text(tip.text)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.white) // Set text color to white for contrast
                        }
                    }
                    .frame(width: 300, height: 200)
                    .scaleEffect(1.0 - abs(distance(tip.id)) * 0.2)
                    .opacity(1.0 - abs(distance(tip.id)) * 0.3)
                    .offset(x: myXOffset(tip.id), y: 0)
                    .zIndex(1.0 - abs(distance(tip.id)) * 0.1)
                    .onTapGesture {
                        // Move card to center
                        withAnimation {
                            snappedItem = Double(tip.id)
                            draggingItem = snappedItem
                        }
                    }
                }
            }
            .gesture(getDragGesture())
            .onAppear {
                // Initial setup if needed
            }
            
            Spacer() // Additional space to push the button down
            
            // Back Button
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the view
            }) {
                HStack {
                    Image(systemName: "chevron.left") // Back icon
                    Text("Back to Reminders")
                        .fontWeight(.bold)
                }
                .font(.headline)
                .padding(.vertical, 10)
                .padding(.horizontal, 70)
                .foregroundColor(.black)
                .background(Color("trq"))
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .padding() // Overall padding
        .navigationBarBackButtonHidden(true) // Hide the back button
    }

    private func getDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                draggingItem = snappedItem + value.translation.width / 100
            }
            .onEnded { value in
                withAnimation {
                    draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                    draggingItem = round(draggingItem).remainder(dividingBy: Double(store.tips.count))
                    snappedItem = draggingItem
                    
                    // Get the active Tip index
                    self.activeIndex = Int(draggingItem).nonnegativeModulo(store.tips.count)
                }
            }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.tips.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.tips.count) * distance(item)
        return sin(angle) * 200
    }
}

extension Int {
    func nonnegativeModulo(_ modulus: Int) -> Int {
        return ((self % modulus) + modulus) % modulus
    }
}

#Preview {
    TipsView()
}

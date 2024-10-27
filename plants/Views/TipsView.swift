//
//  tipsView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct TipsView: View {
    let plantTips = [
        ("Water your plants regularly but avoid overwatering.", "drop.fill"),
        ("Ensure your plants get enough sunlight; some plants prefer indirect light.", "sun.max.fill"),
        ("Use the right type of soil for your plants to thrive.", "laurel.trailing"),
        ("Fertilize during the growing season for better growth.", "leaf.fill"),
        ("Prune dead or yellowing leaves to encourage new growth.", "scissors"),
        ("Keep an eye out for pests and treat them promptly.", "ladybug"),
        ("Repot your plants every couple of years to provide fresh nutrients.", "leaf.arrow.triangle.circlepath")
    ]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) { // Space between cards
                    ForEach(plantTips, id: \.0) { tip, imageName in
                        VStack {
                            Image(systemName: imageName) // Use the corresponding image
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.top)
                            
                            Text(tip)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                        }
                        .frame(maxWidth: .infinity) // Make the card fill the width
                        .background(Color("trq"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2) // Add shadow for depth
                    }
                }
                .padding() // Add padding around the VStack
                Spacer() // Push the button to the bottom

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
                                 .cornerRadius(10)                                 .foregroundColor(.black)
                                 .cornerRadius(10)
                                 .padding(.horizontal)
                             }

                
            }
            .navigationTitle("Plant Care Tips")
            .navigationBarTitleDisplayMode(.inline)
           
        } .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TipsView()
}

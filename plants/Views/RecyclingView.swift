//
//  RecyclingView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct RecyclingView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
       
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Title
                    Text("The Importance of Recycling")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Explanation
                    Text("Recycling is the process of converting waste materials into new materials and objects. It helps reduce the consumption of fresh raw materials, lowers energy usage, decreases greenhouse gas emissions, and reduces the need for landfill space.")
                        .font(.body)
                        .padding()

                    // Benefits Section
                    Text("Benefits of Recycling for Plants and Nature")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Benefits List
                    VStack(spacing: 10) {
                        BenefitCard(title: "1. Conserves Natural Resources", description: "Recycling reduces the need for extracting, refining, and processing raw materials, which can help protect habitats for plants and wildlife.")
                        
                        BenefitCard(title: "2. Saves Energy", description: "Manufacturing products from recycled materials often requires less energy compared to producing them from virgin materials, reducing pollution and greenhouse gas emissions.")
                        
                        BenefitCard(title: "3. Reduces Waste", description: "By recycling, we keep materials out of landfills, which can harm the environment and threaten plant and animal habitats.")
                        
                        BenefitCard(title: "4. Encourages Sustainable Practices", description: "Recycling promotes a culture of sustainability, encouraging people to be more mindful of their consumption and waste.")
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
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
            .navigationTitle("Recycling for Nature")
            .navigationBarTitleDisplayMode(.inline)
           
        } .navigationBarBackButtonHidden(true)
    }
}

struct BenefitCard: View {
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Text(description)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color("trq"))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    RecyclingView()
}

//
//  RecyclingView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct RecyclingView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = RecyclingViewModel() // Initialize the ViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("My plants 🌱")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)

                        // Divider below the title
                        Divider()
                            .background(Color.gray)
                    }
                    // Image at the center
                    Image("recy_plant") // Make sure the image is added to your asset catalog
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200) // Adjust size as needed
                        .padding(.top)

                    // Title
                    Text("The Importance of Recycling")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

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
                        ForEach(viewModel.benefits) { benefit in
                            BenefitCard(title: benefit.title, description: benefit.description)
                        }
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
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
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

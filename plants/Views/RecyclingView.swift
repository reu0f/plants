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
                VStack(spacing: 20) {
                    // Title Section
                    VStack(alignment: .leading) {
                        Text("My plants 🌱")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)

                        Divider()
                            .background(Color.gray)
                    }

                    // Center Image
                    Image("recy_plant")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.top)


                    // Benefits Section
                    Section(header: Text("Benefits of Recycling for Plants and Nature")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)) {

                        // Benefits List
                        ForEach(viewModel.benefits) { benefit in
                            BenefitCard(title: benefit.title, description: benefit.description)
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
                
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
                    .padding(.horizontal, 50)
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
            HStack {
                Image(systemName: "leaf.fill") // Example icon
                    .foregroundColor(.yellGreen)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color("trq").opacity(0.1)) // Light background for separation
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    RecyclingView()
}

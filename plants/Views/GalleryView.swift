//
//  MagazineView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct GalleryView: View {
    let images: [String] = [
        "plant1",
        "plant2",
        "plant3",
        "plant4",
        "plant5",
        "plant6",
        "plant7",
        "plant8",
        "plant9"
    ]
    
    let comments: [String] = [
        "A beautiful anthurium clarinervum.",
        "Bonsai japanese maple tree.",
        "Fritillaria persica.",
        "Purple calla lily.",
        "Blue Hydrangea.",
        "Spider lilies.",
        "Lily of the valley flowers.",
        "Epiphyllum.",
        "Venus flytrap."
    ]
    
    @Environment(\.presentationMode) var presentationMode // Environment variable to control presentation

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("My plants 🌱")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Divider below the title
                    Divider()
                        .background(Color.gray)
                }
           

                TabView {
                    ForEach(images.indices, id: \.self) { index in
                        VStack {
                            Image(images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 500) // Adjust height as needed
                                .clipped()
                            
                            // Display comment below the image
                            Text(comments[index])
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
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

#Preview {
    GalleryView()
}


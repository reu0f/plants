//
//  MagazineView.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

struct MagazineView: View {
    let images: [String] = [
        "plant1", 
        "plant2",
        "plant3",
        "plant4","plant5",
        "plant6",
        "plant7",
        "plant8",
        "plant9"
    ]
    @Environment(\.presentationMode) var presentationMode // Environment variable to control presentation

    var body: some View {
        NavigationView {
            VStack {
                Text("𖤣.𖥧.𖡼.⚘𖤣.𖥧.𖡼.⚘")
                    .font(.largeTitle)
                    .foregroundColor(Color("trq"))
                    .fontWeight(.bold)
                    .padding(.top)

                TabView {
                    ForEach(images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 500) // Adjust height as needed
                            .clipped()
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
                                 .cornerRadius(10)                                 .foregroundColor(.black)
                                 .cornerRadius(10)
                                 .padding(.horizontal)
                             }
            }
            .navigationTitle("Magazine")
            .navigationBarTitleDisplayMode(.inline)
           
        } .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MagazineView()
}

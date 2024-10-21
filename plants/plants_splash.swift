//
//  plants_splash.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//

import SwiftUI

struct plants_splash: View {
    @State private var showingReminderView = false // State to track showing reminder view

    var body: some View {
        //.navigationTitle("my") and navigationStack before the vstack
        VStack {
           
             Text("My Plants🌱")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding([.top, .trailing])
                           .padding([.top, .trailing])
       
            Divider()
                .overlay(Color.gray)

            // Logo
            Image("logo_plant")
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 300)
               .padding(.top)
            
            Text("Start Your Plant Journey!")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)

            // Subtitle
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
                .foregroundColor(Color("grass")) // Set the color grass
            
            // Button
            Button(action: {
                showingReminderView = true // Show reminder view when button is tapped
            }) {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 70)
                    .foregroundColor(.black)
                    .background(Color("trq"))
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .sheet(isPresented: $showingReminderView) {
                SetReminderView() // Present the reminder view
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black) // Background color
        .edgesIgnoringSafeArea(.all) // Extend background
    }
}



#Preview {
   plants_splash()
}

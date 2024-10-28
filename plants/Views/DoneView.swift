//
//  DoneView.swift
//  plants
//
//  Created by Reuof on 19/04/1446 AH.
//

import SwiftUI

struct DoneView: View {
    @Binding var showsheet: Bool
    @Binding var reminders: [Reminder] // Add a binding for reminders
    @State private var showSetReminderView = false // State to control the sheet presentation

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants🌱")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .trailing]) // Keep this padding
                Divider().overlay(Color.gray)

                Image("done_plants")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .padding(.top)

                Text("All Done! 🎉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Text("All Reminders Completed")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("grass"))

                Button(action: {
                    showSetReminderView.toggle() // Toggle the state to show the sheet
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                    .padding()
                    .foregroundColor(Color("trq")) // Set color for the button
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 1)
                }
                .padding(.top, 50)
                .padding(.horizontal, 20) // Add some horizontal padding
                .padding(.bottom, 40) // Add bottom padding for better spacing
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true) // Hide the back button
            .padding()
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showSetReminderView) {
                SetReminderView(reminders: $reminders) // Present the SetReminderView
            }
        }
    }
}

#Preview {
    DoneView(showsheet: .constant(false), reminders: .constant([])) // Provide a binding for preview
}

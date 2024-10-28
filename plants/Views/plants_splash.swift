//
//  plants_splash.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//

import SwiftUI

struct plants_splash: View {
    @State private var showingReminderView = false
    @State private var reminders: [Reminder] = [] // State for reminders
    @State private var navigateToTodaysReminder = false // State for navigation

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .trailing])
                    .padding([.top, .trailing])
                    .padding([.top, .trailing])

                Divider().overlay(Color.gray)

                Image("logo_plant")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .padding(.top)

                Text("Start Your Plant Journey!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("grass"))

                Button(action: {
                    showingReminderView = true
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
                    SetReminderView(reminders: $reminders) // Pass reminders binding
                        .onDisappear {
                            navigateToTodaysReminder = true // Trigger navigation after dismissal
                        }
                }

                // Hidden NavigationLink to TodaysReminder
                NavigationLink(destination: TodaysReminder(reminders: $reminders), isActive: $navigateToTodaysReminder) {
                    EmptyView() // This link is hidden
                }

                Spacer()
            }
            .padding()
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true) // Hide the back button
        } .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    plants_splash()
}


//
//  TodaysReminder.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//


import SwiftUI

struct TodaysReminder: View {
    @Binding var reminders: [Reminder]
    @State private var showsheet = false
    @State private var allDone = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                // Navigation title
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Divider below the title
                Divider()
                    .background(Color.gray)
                
                
                // HStack for three buttons
                HStack {
                    NavigationLink(destination: TipsView()) { // Link to TipsView
                        VStack {
                            Image(systemName: "leaf.fill") // Example icon
                            Text("Tips")
                                .fontWeight(.bold)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: RecyclingView()) {
                        VStack {
                            Image(systemName: "arrow.3.trianglepath")
                            Text("Recycling for Nature")
                                .fontWeight(.bold)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color("leaf"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    NavigationLink(destination: GalleryView()) {
                        VStack {
                            Image(systemName: "magazine.fill") // Use an appropriate icon
                            Text("Plant Gallery")
                                .fontWeight(.bold)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color("yell")) // Set your desired color
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding() // Add some padding around the HStack
                
                VStack {
                    if allDone {
                        DoneView(showsheet: $showsheet, reminders: $reminders)
                    } else {
                        List {
                            Section(header: headerView) {
                                ForEach(reorderedReminders) { reminder in
                                    ReminderView(reminder: reminder) {
                                        // Action to toggle the reminder
                                        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
                                            reminders[index].isChecked.toggle()
                                            checkIfAllDone()
                                            reorderReminders() // Reorder reminders after toggling
                                        }
                                    }
                                    .listRowBackground(Color.clear) }
                                .onDelete(perform: deleteItems)
                            }
                        }
                        
                        .navigationBarBackButtonHidden(true)
                        
                        Button(action: { showsheet.toggle() }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("New Reminder")
                                    .foregroundColor(Color("trq"))
                            }
                            .foregroundColor(Color("trq"))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        }
                    }
                }
                .sheet(isPresented: $showsheet) {
                    SetReminderView(reminders: $reminders)
                }
            }
            //.navigationBarBackButtonHidden(true)
        } .navigationBarBackButtonHidden(true)
    }
    private var headerView: some View {
        VStack(spacing: 0) {
            Divider().overlay(Color.gray)
            HStack {
                Text("Today ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                Spacer()
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
        checkIfAllDone()
    }

    private func checkIfAllDone() {
        allDone = reminders.allSatisfy { $0.isChecked }
    }
    
    private var reorderedReminders: [Reminder] {
        reminders.sorted { !$0.isChecked && $1.isChecked }
    }
    
    private func reorderReminders() {
        reminders.sort { !$0.isChecked && $1.isChecked }
    }
}

#Preview {
    TodaysReminder(reminders: .constant([]))
} 

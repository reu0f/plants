//
//  TodaysReminder.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//
import SwiftUI

struct TodaysReminder: View {
    @Binding var reminders: [Reminder] // Accept reminders as a binding
    @State private var showsheet = false
    @State private var allDone = false // State to track if all reminders are done
    
    var body: some View {
        NavigationView {
            VStack {
                if allDone {
                    DoneView(showsheet: $showsheet, reminders: $reminders) // Show DoneView if all reminders are completed
                } else {
                    List {
                        Section(header: headerView) {
                            ForEach(reminders) { reminder in
                                ReminderView(reminder: reminder) {
                                    // Action to toggle the reminder
                                    if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
                                        reminders[index].isChecked.toggle()
                                        checkIfAllDone() // Check if all reminders are done
                                    }
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                    }
                    .navigationTitle("My Plants 🌱")
                    .navigationBarBackButtonHidden(true) // Hide the back button
                    
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
                SetReminderView(reminders: $reminders) // Pass reminders binding to SetReminderView
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        VStack(spacing: 0) {
            Divider().overlay(Color.gray)
            HStack {
                Text("Today   𖤣.𖥧.𖡼.⚘𖤣.𖥧.𖡼.⚘")
                    .font(.title3) // or any other font style you prefer
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 8) // Optional padding for better spacing
                Spacer() // This will push the text to the left
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
        checkIfAllDone() // Check if all reminders are done after deletion
    }
    
    private func checkIfAllDone() {
        allDone = reminders.allSatisfy { $0.isChecked } // Check if all reminders are marked as checked
    }
}

#Preview {
    TodaysReminder(reminders: .constant([])) // Provide a binding for preview
}


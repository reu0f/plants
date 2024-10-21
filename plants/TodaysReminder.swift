//
//  TodaysReminder.swift
//  plants
//
//  Created by Reuof on 17/04/1446 AH.
//
import SwiftUI

struct TodaysReminder: View {
    @State private var plantReminders: [String] = []
    @State private var newPlant: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My plants🌱")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.top, .trailing])
                    .padding([.top, .trailing])
                    .padding([.top, .trailing])
                
                Divider()
                    .overlay(Color.gray)

                
                Text("Today")
                    .font(.title2)
                    .padding(.top, 10)
                
                List {
                    ForEach(plantReminders, id: \.self) { plant in
                        Text(plant)
                            .swipeActions {
                                Button(role: .destructive) {
                                    if let index = plantReminders.firstIndex(of: plant) {
                                        plantReminders.remove(at: index)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                    .onDelete(perform: deleteReminder)
                }
                
                HStack {
                    TextField("Add a new plant", text: $newPlant)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addReminder) {
                        Text("Add")
                    }
                }
                .padding()
            }.padding()
                .background(Color.black) // Background color
                .edgesIgnoringSafeArea(.all) // Extend background
            .navigationTitle("")
        }
    }
    
    private func addReminder() {
        if !newPlant.isEmpty {
            plantReminders.append(newPlant)
            newPlant = ""
        }
    }
    
    private func deleteReminder(at offsets: IndexSet) {
        plantReminders.remove(atOffsets: offsets)
    }
}

struct TodaysReminder_Previews: PreviewProvider {
    static var previews: some View {
        TodaysReminder()
    }
}

//
//  RecyclingViewModel.swift
//  plants
//
//  Created by Reuof on 23/04/1446 AH.
//

import SwiftUI

class RecyclingViewModel: ObservableObject {
    @Published var benefits: [Benefit] = [
        Benefit(title: "1. Conserves Natural Resources", description: "Recycling reduces the need for extracting, refining, and processing raw materials, which can help protect habitats for plants and wildlife."),
        Benefit(title: "2. Saves Energy", description: "Manufacturing products from recycled materials often requires less energy compared to producing them from virgin materials, reducing pollution and greenhouse gas emissions."),
        Benefit(title: "3. Reduces Waste", description: "By recycling, we keep materials out of landfills, which can harm the environment and threaten plant and animal habitats."),
        Benefit(title: "4. Encourages Sustainable Practices", description: "Recycling promotes a culture of sustainability, encouraging people to be more mindful of their consumption and waste.")
    ]
}



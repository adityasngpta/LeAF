//
//  CostSavingsCalculatorView.swift
//  LeAF
//
//  Created by Aditya Sengupta on 10/19/24.
//


import SwiftUI

struct CostSavingsCalculatorView: View {
    @State private var fieldSize: Double = 100
    @State private var pesticidesPerAcre: Double = 50
    @State private var pesticideCost: Double = 20
    
    var estimatedSavings: Double {
        let totalCost = fieldSize * pesticidesPerAcre * pesticideCost
        return totalCost * 0.3 // Assuming 30% savings with LeAF
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input Field Details")) {
                HStack {
                    Text("Field Size (acres)")
                    Spacer()
                    TextField("Field Size", value: $fieldSize, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("Pesticides per Acre (lbs)")
                    Spacer()
                    TextField("Pesticides", value: $pesticidesPerAcre, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("Pesticide Cost ($/lb)")
                    Spacer()
                    TextField("Cost", value: $pesticideCost, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
            }
            
            Section(header: Text("Estimated Annual Savings")) {
                Text("$\(estimatedSavings, specifier: "%.2f")")
                    .font(.headline)
            }
            
            Section(header: Text("How It Works")) {
                Text("This calculator estimates potential savings based on reduced pesticide usage. Actual savings may vary depending on specific farm conditions and pest pressures.")
            }
            
            Text("Environmental Impact of LeAF")
                .font(.title)
                .bold()
            
            Text("LeAF aims to significantly reduce the environmental footprint of agriculture:")
            
            Group {
                Text("Reducing Chemical Usage")
                    .font(.headline)
                Text("• Minimizes indiscriminate pesticide application")
                Text("• Enables targeted treatment of affected areas")
                Text("• Reduces overall chemical consumption in agriculture")
            }
            
            Group {
                Text("Greenhouse Gas Reduction")
                    .font(.headline)
                Text("• Decreases emissions from chemical manufacturing")
                Text("• Reduces transportation-related emissions for chemicals")
                Text("• Lowers soil emissions of nitrous oxide and methane")
            }
            
            Group {
                Text("Ecosystem Preservation")
                    .font(.headline)
                Text("• Minimizes chemical leakage into surrounding environments")
                Text("• Protects beneficial insects and wildlife")
                Text("• Helps maintain biodiversity in agricultural areas")
            }
            
            Group {
                Text("Resource Conservation")
                    .font(.headline)
                Text("• Optimizes water usage through precise pest management")
                Text("• Reduces energy consumption in chemical production")
                Text("• Improves overall resource efficiency in farming")
            }
            
            Text("Long-term Benefits")
                .font(.headline)
            Text("• Contributes to sustainable agricultural practices")
            Text("• Helps mitigate climate change impacts")
            Text("• Supports food security while minimizing environmental harm")
            
        }
        .navigationBarTitle("Cost Savings Calculator")
    }
}

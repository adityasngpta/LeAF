import SwiftUI

struct EnviroImpactView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image("EnvironmentalImpact") // Placeholder for environmental impact visualization
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
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
            .padding()
        }
        .navigationBarTitle("Environmental Impact")
    }
}


// Pest Detection
// Crop Image Analysis
// Field Map Analysis
// Agricultural Q&A
// Environmental & Cost Savings
// Field Map + Insect Name
// Type your question here
//

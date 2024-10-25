import SwiftUI

struct IntroductionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // LeAF Introduction
                Group {
                    Image("Image") // Updated to LeAF logo
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                    
                    Text("What is LeAF?")
                        .font(.title)
                        .bold()
                    
                    Text("LeAF is an end-to-end agricultural app that uses advanced AI technologies to assist farmers in monitoring and maintaining plant health. It focuses on detecting and classifying agricultural pests, helping farmers optimize their crop yield while minimizing chemical usage and environmental impact.")
                }
                
                // Problem Statement
                Group {
                    Text("The Problem")
                        .font(.title2)
                        .bold()
                    
                    Text("• Over 40% of global crop production is lost to plant anomalies, costing $220 billion annually.")
                    Text("• Excessive and indiscriminate use of chemicals leads to environmental harm and increased production costs.")
                    Text("• Manual surveying of large fields is time-consuming and often impractical for farmers.")
                }
                
                // LeAF Solution
                Group {
                    Text("LeAF Solution")
                        .font(.title2)
                        .bold()
                    
                    Text("• Real-time pest detection and classification using Convolutional Neural Networks (CNNs).")
                    Text("• Lightweight models for mobile and edge device deployment, enabling in-field use.")
                    Text("• Integration with agricultural robots and tractors for automated field surveying.")
                    Text("• Data-driven insights for targeted and efficient pest management.")
                }
                
                // Key Features
                Group {
                    Text("Key Features")
                        .font(.title2)
                        .bold()
                    
                    Text("1. Advanced Image Processing")
                        .bold()
                    Text("Utilizes GroundingDINO and YOLOv8n models for accurate pest detection and classification.")
                    
                    Text("2. Efficient Model Architecture")
                        .bold()
                    Text("Employs model distillation techniques to achieve a 300x reduction in inference latency and 600x reduction in model size.")
                    
                    Text("3. Unknown Pest Detection")
                        .bold()
                    Text("Incorporates an 'unknown' class to handle out-of-distribution pests, ensuring system adaptability.")
                    
                    Text("4. Field Mapping")
                        .bold()
                    Text("Correlates pest data with mapped field arrays for comprehensive monitoring.")
                    
                    Text("5. LLM-powered Analysis")
                        .bold()
                    Text("Provides treatment suggestions and answers farmer questions using agricultural domain-adapted Large Language Models.")
                }
                
                // Environmental Impact
                Group {
                    Text("Environmental Impact")
                        .font(.title2)
                        .bold()
                    
                    Text("LeAF aims to reduce the environmental footprint of agriculture by:")
                    Text("• Minimizing indiscriminate pesticide use")
                    Text("• Optimizing chemical application strategies")
                    Text("• Reducing greenhouse gas emissions related to chemical use")
                    Text("• Preserving biodiversity by protecting beneficial insects")
                }
                
                // Future Developments
                Group {
                    Text("Future Developments")
                        .font(.title2)
                        .bold()
                    
                    Text("• Expansion to cover more types of plant anomalies, including diseases and weeds")
                    Text("• Integration with more agricultural IoT devices and robots")
                    Text("• Continuous model improvement based on real-world deployment feedback")
                    Text("• Enhanced natural language interface for easier farmer interaction")
                }
            }
            .padding()
        }
        .navigationBarTitle("About LeAF")
    }
}

#Preview {
    IntroductionView()
}

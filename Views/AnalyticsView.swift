import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        List {
            Section(header: Spacer()) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Field Map")
                        .font(.title)
                        .bold()
                    
                    Image("Field")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Japanese Beetle Infestation")
                        .italic()
                }
            }
            
            Section(header: Spacer()) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Analysis")
                        .font(.title)
                        .bold()

                    Text("In this field, there is a cluster of Japanese Beetles concentrated in the northwest central region, extending 3 rows east and 4 rows south. Other areas of the field have little to no Japanese Beetle presence. Combat Japanese Beetle damage with targeted measures. Apply neonicotinoids or pyrethroids early for effective insecticide control. Enhance resilience by adopting cultural practices like crop rotation and debris removal, disrupting the beetles' life cycle to minimize future infestations. Regular monitoring ensures timely intervention, safeguarding crops from defoliation and yield loss.")
                }
            }
        }
        .navigationBarTitle("Field Map Analysis")
    }
}

#Preview {
    AnalyticsView()
}

import SwiftUI

struct ContentView: View {
    @StateObject
    var viewModel = ConversationViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Introduction")) {
                    NavigationLink(destination: IntroductionView()) {
                        Label("About LeAF", systemImage: "info.circle")
                    }
                }
                Section(header: Text("Pest Management Tools")) {
                    NavigationLink(destination: StoryboardWrapper()) {
                        Label("Pest Detection", systemImage: "camera")
                    }
                    NavigationLink(destination: CameraContainerView().navigationBarTitle("", displayMode: .inline)) {
                        Label("Crop Image Analysis", systemImage: "magnifyingglass.circle")
                    }
                    NavigationLink(destination: AnalyticsView()) {
                        Label("Field Map Analysis", systemImage: "square.grid.2x2")
                    }
                    NavigationLink {
                        ConversationScreen()
                            .environmentObject(viewModel)
                    } label: {
                        Label("Agricultural Q&A", systemImage: "ellipsis.message")
                    }
                    NavigationLink(destination: CostSavingsCalculatorView()) {
                        Label("Environment/Cost Savings", systemImage: "globe.americas")
                    }
                }
            }
            .navigationTitle("LeAF")
        }
    }
    
    // STORYBOARD WRAPPER
    struct StoryboardWrapper: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateInitialViewController()!
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // Update the view controller if needed
        }
    }
}
    
    #Preview {
        ContentView()
    }

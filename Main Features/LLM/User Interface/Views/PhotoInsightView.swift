import SwiftUI

struct PhotoInsightView: View {
    
    typealias Completion = (ImageDescription) -> Void
    
    // MARK: Properties
    
    @Environment(\.dismiss) var dismiss
    @State private var isAlertPresented = false
    
    let uiImage: UIImage
    let completion: Completion?
    
    // MARK: Initialization
    
    init(uiImage: UIImage, completion: Completion? = nil) {
        self.uiImage = uiImage
        self.completion = completion
    }
    
    // MARK: `body`
    
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .accessibilityHidden(true)
            
            VStack(spacing: 24.0) {
                toolbar
                
                Spacer()
                
                ProgressView()
                    .controlSize(.extraLarge)
                    .tint(.white)
                    .accessibilityHidden(true)
                
                Text("Analyzing image using LeAF Model...")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 24.0)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.75))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 24.0)
        .background(.black)
        .onAppear { sendRequest() }
        .onDisappear() { cancelRequest() }
        .alert(isPresented: $isAlertPresented, content: { alert })
    }
    
    // MARK: Views
    
    @ViewBuilder
    private var toolbar: some View {
        HStack {
            Button("Cancel") {
                // Dismiss modal view
                dismiss()
            }
            
            Spacer()
        }
        .padding(.horizontal, 12.0)
        .foregroundColor(.white)
    }
    
    private var dismissButton: Alert.Button {
        let label = Text("Dismiss")
        
        return Alert.Button.default(label) {
            requestCompleted(description: "Failed to load model.")
        }
    }
    
    private var alert: Alert {
        let title = Text("Oops! Something went wrong.")
        let message = Text("Try again later.")
        
        return Alert(title: title, message: message, dismissButton: dismissButton)
    }
    
    // MARK:-
    
    private func sendRequest() {
        OpenAIService.shared.describe(uiImage: uiImage, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let description):
                    requestCompleted(description: description)
                    return
                case .failure(let error):
                    print("Error! [\(error.localizedDescription)]")
                    isAlertPresented = true
                    return
                }
            }
        })
    }
    
    private func cancelRequest() {
        // TODO: (MEKNE)
        
        // Dismiss the modal view
        dismiss()
    }
    
    private func requestCompleted(description: String) {
        let result = ImageDescription(id: UUID().uuidString, uiImage: uiImage, description: description)
        completion?(result)
        
        // Dismiss the modal view
        dismiss()
    }
    
}

#Preview {
    PhotoInsightView(uiImage: UIImage(named: "preview")!)
}

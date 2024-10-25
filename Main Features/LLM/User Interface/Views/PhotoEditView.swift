import SwiftUI

struct PhotoEditView: View {
    
    // MARK: Properties
    
    @Environment(\.dismiss) var dismiss
    @State private var filename: String
    @State private var description: String
    @State private var item: ImageDescription
    @State private var isAlertPresented = false
    private let root = "LeAF-LLM/Descriptions"
    
    // MARK: Initialization
    
    init(item: ImageDescription) {
        _item = .init(initialValue: item)
        _description = .init(initialValue: item.description)
        _filename = .init(initialValue: item.id)
        createDirIfNeeded(for: filename)
    }
    
    // MARK: `body`
    
    var body: some View {
        VStack(spacing: 24.0) {
            toolbar
                        
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 12.0) {
                Text("LeAF Report")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Edit image description", text: $description, axis: .vertical)
                    .padding(8.0)
                    .background(.white)
                    .cornerRadius(5.0)
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 12.0)
        .background(.black)
        .foregroundColor(.white)
        .alert(isPresented: $isAlertPresented, content: { alert })
        .navigationBarHidden(true) // Hide the navigation bar
    }
    
    // MARK: Views
    
    @ViewBuilder
    private var toolbar: some View {
        HStack {
            Button("Cancel") {
                cancel()
            }
            
            Spacer()
            
            Button("Delete") {
                deleteDirIfExists(for: item.id)
                cancel()
            }
            .foregroundStyle(Color.red)
            
            Spacer()
            
            Button("Done") {
                done()
            }
        }
        .padding(.horizontal, 12.0)
        .foregroundColor(.white)
    }
    
    private var discardButton: Alert.Button {
        let label = Text("Discard Changes")
        
        return Alert.Button.destructive(label) {
            // Dismiss the modal view
            dismiss()
        }
    }
    
    private var editButton: Alert.Button {
        let label = Text("Keep Editing")
        
        return Alert.Button.default(label)
    }
    
    private var alert: Alert {
        let title = Text("Unsaved changes")
        let message = Text("Are you sure you want to discard your changes")
        
        return Alert(title: title, message: message, primaryButton: editButton, secondaryButton: discardButton)
    }
    
    // MARK:-
    
    func createDirIfNeeded(for filename: String) {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(root)/\(filename)" + "/")
        do {
            try FileManager.default.createDirectory(atPath: dir.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteDirIfExists(for filename: String) {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(root)/\(filename)" + "/")
        do {
            if FileManager.default.fileExists(atPath: dir.path) {
                try FileManager.default.removeItem(atPath: dir.path)
                print("Directory deleted successfully.")
            } else {
                print("Directory does not exist.")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recordingExists(filename: String) -> Bool {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(root)/\(filename)" + "/")
        let filePath = dir.appendingPathComponent("recording.m4a").path
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    private func cancel() {
        if description != item.description {
            isAlertPresented = true
        } else {
            // Dismiss modal view
            dismiss()
        }
    }
    
    private func done() {
        item.description = description
        ImageManager.shared.save(item: item)
        // Dismiss modal view
        dismiss()
    }
    
}

// MARK: Preview Properties

private var item: ImageDescription {
    let uiImage = UIImage(named: "1")!
    let description = "Description1"
    
    return ImageDescription(id: "Image-1", uiImage: uiImage, description: description)
}

private var item2: ImageDescription {
    let uiImage = UIImage(named: "2")!
    let description = "Description2"
    
    return ImageDescription(id: "Image-2", uiImage: uiImage, description: description)
}

#Preview {
    PhotoEditView(item: item2)
}

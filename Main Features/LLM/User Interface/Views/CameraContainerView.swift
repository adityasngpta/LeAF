import SwiftUI

struct CameraContainerView: View {
    
    // MARK: Properties
    
    @State private var navigationPath = NavigationPath()
    @State private var uiImage: UIImage?
    @State private var imageDescription: ImageDescription?
    
    // MARK: `body`
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack(alignment: .bottomLeading) {
                CameraView(didCapturePhoto: { uiImage in
                    self.uiImage = uiImage
                })
                .fullScreenCover(item: $uiImage) { uiImage in
                    PhotoInsightView(uiImage: uiImage) { imageDescription in
                        self.uiImage = nil
                        self.imageDescription = imageDescription
                    }
                }
                .fullScreenCover(item: $imageDescription) { imageDescription in
                    PhotoEditView(item: imageDescription)
                }
                      
                VStack{
                    Spacer()
                    NavigationLink (destination: ImageList().navigationBarTitle("", displayMode: .inline)){
                        Text("Gallery")
                            .padding(15)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(15)
                }
            }
       }
    }
        
}
    


#Preview {
    CameraContainerView()
}

// MARK: `Identifiable` extensions
// ... required for `fullScreenCover`

extension UIImage: Identifiable { }
extension ImageDescription: Identifiable { }

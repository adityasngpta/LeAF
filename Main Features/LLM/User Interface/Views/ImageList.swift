import SwiftUI

struct ImageList: View{
    @State private var images: [ImageDescription] = []
    
    init() { 
        self.refreshImages()
    }
    
    var body: some View {
        NavigationSplitView(){
            List(images, id: \.id) { image in
                NavigationLink {
                    PhotoEditView(item: image).navigationBarHidden(true)
                } label: {
                    ImageRow(imageDescription: image)
                }
            }
            .navigationTitle("Reports")
        } detail: {
            Text("Select")
        }
        .onAppear{
            self.refreshImages()
        }
    }
    
    private func refreshImages() {
        images = ImageManager.shared.getAllImageDescriptions()
    }
}

#Preview {
    ImageList()
}

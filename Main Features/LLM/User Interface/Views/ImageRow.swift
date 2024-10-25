import SwiftUI

struct ImageRow: View {
    var imageDescription: ImageDescription
    var body: some View {
        HStack{
            imageDescription.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(String(imageDescription.id))
        }
        .navigationBarHidden(true)
    }
}

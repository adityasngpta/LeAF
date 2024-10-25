/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import UIKit

struct CameraView: View {
    @StateObject private var model = DataModel()
 
    private static let barHeightFactor = 0.15
    
    private var didCapturePhoto: ((UIImage?) -> ())?
    
    init(didCapturePhoto: ((UIImage?) -> ())? = nil) {
        self.didCapturePhoto = didCapturePhoto
    }
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    ViewfinderView(image: $model.viewfinderImage)
                        .ignoresSafeArea()
                    
                    VStack {
                            Text("Take a photo to get analysis of pests infestations and crop health!")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.horizontal, 12.0)
                                .background(.black.opacity(0.75))
                                .frame(maxHeight: geometry.size.height * Self.barHeightFactor)
                
                        
                        Color.clear
                            .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                        
                        buttonsView()
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                            .background(.black.opacity(0.75))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .task {
                    await model.camera.start()
                    await model.loadPhotos()
                    await model.loadThumbnail()
                }
                .background(.black)
            }
        }
        .onAppear() {
            model.camera.didCapturePhoto = didCapturePhoto
        }
       // .navigationBarHidden(true)
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            Button {
                model.camera.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    CameraView()
}

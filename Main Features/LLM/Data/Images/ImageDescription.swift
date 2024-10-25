import Foundation
import UIKit
import SwiftUI

struct ImageDescription: Hashable {
    
    // MARK: Properties
    
    //let id = UUID()
    var id: String
    let uiImage: UIImage
    var description: String
    
    var image: Image {
        return Image(uiImage: uiImage)
    }
}

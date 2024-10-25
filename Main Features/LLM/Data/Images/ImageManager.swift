import Foundation
import UIKit

class ImageManager {
    
    // MARK: Properties
    
    private let root = "LeAF-LLM/Descriptions"
    
    static let shared = ImageManager()
    
    // MARK: Initiazliation
    
    private init() { createDirIfNeeded(for: "")}
    
    // MARK: Images
    
    func save(item: ImageDescription) {
        let image = item.uiImage
        let description = item.description
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        
        let fileName = item.id
        let imageURL = getImageURL(for: fileName)
        let descriptionURL = getDescriptionURL(for: fileName)
        
        do {
            //createDirIfNeeded(for: fileName)
            try data.write(to: imageURL)
            try description.write(to: descriptionURL, atomically: true, encoding: .utf8)
            print("Saved image and description to \(root)/\(fileName)")
        } catch {
            print("Failed to save image and description: \(error)")
        }
    }
    
    func getImageDescription(fileName: String) -> ImageDescription? {
        let imageURL = getImageURL(for: fileName)
        let descriptionURL = getDescriptionURL(for: fileName)
        
        guard let uiImage = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        
        guard let description = try? String(contentsOf: descriptionURL) else {
            return nil
        }
        
        return ImageDescription(id: fileName, uiImage: uiImage, description: description)
    }
    
    func getAllImageDescriptions() -> [ImageDescription] {
        let documentsDirectory = getDocumentsDirectory()
        let rootDirectory = documentsDirectory.appendingPathComponent(root)
        var imageDescriptions = [ImageDescription]()
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: rootDirectory, includingPropertiesForKeys: nil)
            
            for fileURL in fileURLs {
                let fileName = fileURL.lastPathComponent
                
                if let imageDescription = getImageDescription(fileName: fileName) {
                    imageDescriptions.append(imageDescription)
                }
            }
        } catch {
            print("Failed to read contents of directory: \(error)")
        }
        print("Successfully returned all image descriptions!")
        return imageDescriptions
    }
    
    // MARK: `FileManager`
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func getImageURL(for filename: String) -> URL
    {
        return getDocumentsDirectory().appendingPathComponent("\(root)/\(filename)/image.jpg")
    }
    
    private func getDescriptionURL(for filename: String) -> URL
    {
        return getDocumentsDirectory().appendingPathComponent("\(root)/\(filename)/description.txt")
    }
    
    func createDirIfNeeded(for filename: String) {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(root)/\(filename)" + "/")
        do {
            try FileManager.default.createDirectory(atPath: dir.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

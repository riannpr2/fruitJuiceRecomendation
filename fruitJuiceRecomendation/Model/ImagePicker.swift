//
//  ImagePicker.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var uiImage: UIImage?
    @Binding var isPresenting: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        imagePicker.modalPresentationStyle = .fullScreen // Set to full screen
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.uiImage = image
            }
            parent.isPresenting = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresenting = false
        }
    }
}



//codingan sebelum diubah ubah

//import SwiftUI
//import UIKit
//
//
//struct ImagePicker: UIViewControllerRepresentable {
//    
//    @Binding var uiImage: UIImage?        
//    @Binding var isPresenting: Bool
//    @Binding var sourceType: UIImagePickerController.SourceType
//    
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = sourceType
//        imagePicker.delegate = context.coordinator
//        imagePicker.modalPresentationStyle = .fullScreen
//        return imagePicker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//    }
//    
//    typealias UIViewControllerType = UIImagePickerController
//        
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        
//        let parent: ImagePicker
//                
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            parent.uiImage = info[.originalImage] as? UIImage
//            parent.isPresenting = false
//        }
//        
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.isPresenting = false
//        }
//        
//        init(_ imagePicker: ImagePicker) {
//            self.parent = imagePicker
//        }
//        
//    }
//    
//    
//}
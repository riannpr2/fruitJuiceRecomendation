//
//  ImageClassification.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import SwiftUI
//TODO: bedanya Classifier sama ImageClassifier apa ya? karena di sini juga at the end ngambil nya ke Classifier
class ImageClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
        
    }
        
}

//
//  ContentView.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//

    //codingan yang works

import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = true
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        HStack{
            VStack{
                Button(action: {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.orange)
                        .font(.title)
                }
                
                
                Group {
                    if let imageClass = classifier.imageClass {
                        HStack{
                            Text("Image categories:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                    } else {
                        HStack{
                            Text("Image categories: NA")
                                .font(.caption)
                        }
                    }
                }
                .font(.subheadline)
                .padding()
            }
 

    //batasnya
            
//            Spacer()
            
//bagian untuk memunculkan icon library/galery dan memilih gambar dari library
            
            //                Image(systemName: "photo")
            //                    .onTapGesture {
            //                        isPresenting = true
            //                        sourceType = .photoLibrary
            //                    }
            
            
//bagian untuk memunculkan icon camera dan jika di klik akan memunculkan kamera bawaannya
            
            Image(systemName: "camera")
                .onTapGesture {
                    isPresenting = true
                    sourceType = .camera
                }
            
                .font(.largeTitle)
                .foregroundColor(.blue)
            
//bagian untuk menampilkan bingkai / rectangele (tidak dibutuhkan)
            
            //            Rectangle()
            //                .strokeBorder()
            //                .foregroundColor(.yellow)
            
//bagian untuk menampilkan gambar yang sudah di ambil ketika foto (tidak dibutuhkan)
            //                .overlay(
            //                    Group {
            //                        if uiImage != nil {
            //                            Image(uiImage: uiImage!)
            //                                .resizable()
            //                                .scaledToFill()
            //                                .ignoresSafeArea()
            //                        }
            //                    }
            //                )
            
            
    //codingan yang works
        }
    //batasnya
        
        
        
        
    //codingan yang works
        
        .sheet(isPresented: $isPresenting) {
                    ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                        .onDisappear {
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }
                        .edgesIgnoringSafeArea(.all)  // Mengatur tampilan kamera agar fullscreen
                }
                .padding()
    }
}


#Preview {
    ContentView(classifier: ImageClassifier())
}

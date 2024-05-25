//
//  ContentView.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//


import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = true
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State private var recommendations: String?
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationSplitView{
            List(0..<10){ item in
                Text("halo")
            }
        } detail: {
            Text("Detail View")
        }
        HStack{
            VStack{
                Button(action: {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }) {
//                    Image(systemName: "bolt.fill")
//                        .foregroundColor(.orange)
//                        .font(.title)
                }
                
                Group {
                    if let imageClass = classifier.imageClass {
                        HStack{
                            Text("Fruit Detected:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                            
                        }
                    } else {
                        HStack{
                            Text("Fruit Detected: Take a picture of the available fruit")
                                .font(.caption)
                        }
                    }
                }
                .font(.subheadline)
                .padding()
                
            }
            Spacer()

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
    
    private func recommendFruit(for fruit: String) -> String {
            switch fruit.lowercased() {
            case "apple":
                return "Combine with: Banana, Orange"
            case "banana":
                return "Combine with: Apple, Strawberry"
            case "orange":
                return "Combine with: Apple, Mango"
            default:
                return "No recommendations available"
            }
        }
}


#Preview {
    ContentView(classifier: ImageClassifier())
}



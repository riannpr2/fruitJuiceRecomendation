//
//  ContentView.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//


import SwiftUI
//TODO nama structnya jangan generic (diganti)
struct ContentView: View {
    @State var isPresenting: Bool = true
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State private var recommendations: String?
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        ZStack {
            
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
                    })
                    {
                        
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
                
                
                
                //bagian untuk memunculkan icon camera dan jika di klik akan memunculkan kamera bawaannya
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                
            }
            
//            .sheet(isPresented: $isPresenting) {
//                ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
//                    .edgesIgnoringSafeArea(.all)
//                    
//                // Mengatur tampilan kamera agar fullscreen
//            }
            .padding()
            
            if isPresenting {
                ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                    .onDisappear {
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                        }
                    }
            }
            
        }
    }
    //    TODO: kalo pake switch case gitu kayaknya ga scalable, lebih baik dijadiin model aja Fruit nya
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


//                    Image(systemName: "bolt.fill")
//                        .foregroundColor(.orange)
//                        .font(.title)


//batasnya

//            Spacer()

//bagian untuk memunculkan icon library/galery dan memilih gambar dari library

//                Image(systemName: "photo")
//                    .onTapGesture {
//                        isPresenting = true
//                        sourceType = .photoLibrary
//                    }

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

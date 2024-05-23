//
//  showSheet.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 22/05/24.
//
//
//import SwiftUI
//
//// codingan ke 3
//
//
//
//
//// codingan kedua
//
//struct showSheet: View {
//    @State private var showCustomSheet = false
//    
//    var body: some View {
//        VStack {
//            Button("Show Custom Sheet") {
//                showCustomSheet.toggle()
//            }
//        }
//        .padding()
//        .customSheet(isPresented: $showCustomSheet) {
//            CustomSheetView(showSheet: $showCustomSheet)
//        }
//    }
//}
//
//struct CustomSheetView: View {
//    @Binding var showSheet: Bool
//    
//    var body: some View {
//        HStack {
//            VStack {
//                Text("This is a custom sheet")
//                    .font(.largeTitle)
//                    .padding()
//                
//                Button("Dismiss") {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        showSheet.toggle()
//                    }
//                }
//                .padding()
//            }
//            .frame(maxWidth: 334, maxHeight: 779)
//            .background(Color.white)
//            .cornerRadius(20)
//            .shadow(radius: 20)
//            .transition(.move(edge: .bottom))
//            Spacer()
//        }
//    }
//}
//
//extension View {
//    func customSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
//        ZStack {
//            self
//            if isPresented.wrappedValue {
//                Color.black.opacity(0.3)
//                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        withAnimation(.easeInOut(duration: 0.3)) {
//                            isPresented.wrappedValue = false
//                        }
//                    }
//                content()
//                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.9)
////                    .background(Color.white)
////                    .cornerRadius(20)
////                    .shadow(radius: 20)
//                    .transition(.move(edge: .leading))
//                    .animation(.spring(), value: isPresented.wrappedValue)
//                Spacer()
//            }
//        }
//    }
//}

import SwiftUI

struct showSheet: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome to SwiftUI!")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            
            if showModal {
                BottomSheetView(isShowing: $showModal) {
                    ModalView()
                }
                .transition(.move(edge: .bottom))
                .animation(.spring())
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // Automatically show the modal when the view appears
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showModal = true
            }
        }
    }
}

struct BottomSheetView<Content: View>: View {
    @Binding var isShowing: Bool
    let content: () -> Content
    
    @State private var offset: CGFloat = 0
    @GestureState private var dragState = DragState.inactive

    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HandleBar()
                content()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(y: isShowing ? max(offset + dragState.translation.height, 0) : UIScreen.main.bounds.height)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture()
                    .updating($dragState) { drag, state, _ in
                        state = .dragging(translation: drag.translation)
                    }
                    .onEnded { value in
                        if value.translation.height > 100 {
                            self.isShowing = false
                        }
                    }
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ModalView: View {
    var body: some View {
        VStack {
            Text("This is a modal view")
                .font(.title)
                .padding()
            
            Text("Swipe down to dismiss")
                .foregroundColor(.gray)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct HandleBar: View {
    var body: some View {
        Capsule()
            .frame(width: 40, height: 6)
            .foregroundColor(Color.gray.opacity(0.4))
            .padding(.top, 8)
            .padding(.bottom, 12)
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        showSheet()
    }
}


//        
//        
        
// codingan pertama
        
        
//    @State private var showSheet = false
//
//        var body: some View {
//            VStack {
//                Button("Show Sheet") {
//                    showSheet.toggle()
//                }
//                .sheet(isPresented: $showSheet) {
//                    SheetView()
//                        .frame(width:100)
//                }
//            }
//            .padding()
//        }
//    }
//
//    struct SheetView: View {
//        @Environment(\.presentationMode) var presentationMode
//
//        var body: some View {
//            VStack {
//                Text("This is a sheet")
//                    .font(.largeTitle)
//                    .padding()
//
//                Button("Dismiss") {
//                    presentationMode.wrappedValue.dismiss()
//                }
//                .padding()
//            }
//            
//        }
//    }
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//}

#Preview {
    showSheet()
}

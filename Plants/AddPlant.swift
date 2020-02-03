//
//  AddPlant.swift
//  Landmarks
//
//  Created by Hamid Yuksel on 2020-01-06.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CaptureImageView {
  
  /// MARK: - Properties
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}

extension CaptureImageView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    //picker.sourceType = .camera
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageView>) {
    
  }
}

struct AddPlant: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        ZStack {
          VStack {
            Button(action: {
              self.showCaptureImageView.toggle()
            }) {
              Text("Choose photo")
            }
            image?.resizable()
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 300, height: 300)
              .cornerRadius(20)
              .shadow(radius: 10)
              
          }
          if (showCaptureImageView) {
            CaptureImageView(isShown: $showCaptureImageView, image: $image)
          }
        }
    }
}

struct AddPlant_Previews: PreviewProvider {
    static var previews: some View {
        AddPlant()
    }
}

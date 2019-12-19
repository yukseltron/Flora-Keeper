//
//  PlantDetailEditor.swift
//  Landmarks
//
//  Created by Hamid Yuksel on 2019-12-19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct PlantDetailEditor: View {
    
    var body: some View {
        List {
            HStack {
                Text("Plant name").bold()
                Divider()
            }
            .padding(.bottom)
    }
}

struct PlantDetailEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailEditor()
    }
}

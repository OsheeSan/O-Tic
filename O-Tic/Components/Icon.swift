//
//  Icon.swift
//  O-Tic
//
//  Created by admin on 28.10.2022.
//

import SwiftUI

struct Icon: View {
    
    var img : String
    
    var body: some View {
        Image(systemName: img)
                .font(.system(size: 50))
                .frame(width: 50, height: 50)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
                .cornerRadius(10)
                .foregroundColor(.orange)
    }
    
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon(img: "xmark")
    }
}

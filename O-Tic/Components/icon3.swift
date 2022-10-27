//
//  icon3.swift
//  O-Tic
//
//  Created by admin on 27.10.2022.
//

import SwiftUI

struct icon3: View {
    
    var input = ""
    
    var body: some View {
        if input == "" {
            Image(systemName: "circle")
                .font(.system(size: 50))
                .frame(width: 50, height: 50)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
                .cornerRadius(10)
                .foregroundColor(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
        } else {
            Image(systemName: input == "O" ? "circle" : "xmark")
                .font(.system(size: 50))
                .frame(width: 50, height: 50)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
                .cornerRadius(10)
                .foregroundColor(.orange)
        }
    }
}

struct icon3_Previews: PreviewProvider {
    static var previews: some View {
        icon3()
    }
}

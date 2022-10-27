//
//  MenuView.swift
//  O-Tic
//
//  Created by admin on 27.10.2022.
//

import SwiftUI

struct MenuView: View {
    
    
    var body: some View {
        VStack{
            Text("Welcome to O-Tic!")
                .font(.title).bold()
            Button("Button title") {
            }
            .padding()
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

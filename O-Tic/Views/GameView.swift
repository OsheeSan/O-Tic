//
//  GameView.swift
//  O-Tic
//
//  Created by admin on 27.10.2022.
//

import SwiftUI

struct GameView: View {
    
    @State var XorO = true;
    
    var body: some View {
        VStack(spacing: 80){
            Text("GameView!")
                .font(.title).bold()
            VStack{
                HStack{
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon1()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon2()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon3()
                    }
                }
                HStack{
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon4()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon5()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon6()
                    }
                }
                HStack{
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon7()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon8()
                    }
                    Button(action: {
                        print("button pressed")
                        XorO.toggle()
                    }) {
                        icon9()
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

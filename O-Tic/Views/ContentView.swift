//
//  ContentView.swift
//  O-Tic
//
//  Created by admin on 27.10.2022.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
            NavigationView{
                ZStack{
                    VStack(spacing: 50){
                        NavigationLink(destination: GameView()){
                            Image(systemName: "xmark.circle")
                                            .font(.system(size: 100))
                                            .frame(width: 150, height: 150)
                                            .padding()
                                            .background(Color(hue: 1.0, saturation: 0.015, brightness: 0.155))
                                            .cornerRadius(50)
                                            .foregroundColor(.orange)
                        }
                        VStack{
                            Text("Welcome to O-Tic!")
                                .font(.title).bold()
                                .padding()
                            NavigationLink(destination: GameView()){
                                Text("Start Game!")
                                    .padding()
                                    .frame(width: 150, height: 40, alignment: .center)
                                    .background(.orange)
                                    .cornerRadius(30)
                                    .foregroundColor(.white)
                                    .bold().font(.title3)
                            }
                            .padding(.bottom)
                            .padding(.top)
                        }
                    }
                }
            
            }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

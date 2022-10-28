//
//  GameView.swift
//  O-Tic
//
//  Created by admin on 27.10.2022.
//

import SwiftUI

struct GameView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State var moves: [Move?] = Array(repeating: nil, count: 9)
    @State var whoseTurn = true
    
    var body: some View {
        VStack(spacing: 80){
            Text("GameView!")
                .font(.title).bold()
            LazyVGrid(columns: columns, spacing: 40){
                ForEach(0..<9){ i in
                    Icon(img: moves[i]?.indicator ?? "")
                        .onTapGesture {
                            if isIconEmpty(in: moves, forIndex: i){
                                moves[i] = Move(player: whoseTurn ? .player1 : .player2, boardIndex: i)
                                whoseTurn.toggle()
                            }
                        }
                }
            }
        }
    }
    
    func isIconEmpty(in moves: [Move?], forIndex index: Int) -> Bool{
        return !moves.contains(where: {$0?.boardIndex == index})
    }
    
}

enum Player{
    case player1, player2
}

struct Move{
    var player: Player
    var boardIndex: Int
    
    var indicator: String{
        return player == .player1 ? "xmark" : "circle"
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

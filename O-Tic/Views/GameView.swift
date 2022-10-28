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
    
    @State var v1 = 1
    @State var v2 = 1
    @State var v3 = 0
    
    var body: some View {
        VStack(spacing: 80){
            Text(whoseTurn == true ? "Player -> X" : "Player -> O")
                .font(.title).bold()
            LazyVGrid(columns: columns, spacing: 40){
                if v1 == v2 {
                    ForEach(0..<9){ i in
                        Icon(img: moves[i]?.indicator ?? "")
                            .onTapGesture {
                                
                                    if isIconEmpty(in: moves, forIndex: i){
                                        moves[i] = Move(player: whoseTurn ? .player1 : .player2, boardIndex: i)
                                        whoseTurn.toggle()
                                        isThereIsWinner()
                                        print(v1, v2, v3)
                                    }
                                
                            }
                    }
                } else {
                    ForEach(0..<9){ i in
                        if (i == v1 || i == v2 || i == v3) && v1 != v2 {
                            Icon(img: moves[i]?.indicator ?? "")
                                .padding(3.2)
                                .background(.green)
                                .cornerRadius(10)
                        } else {
                            Icon(img: moves[i]?.indicator ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func isIconEmpty(in moves: [Move?], forIndex index: Int) -> Bool{
        return !moves.contains(where: {$0?.boardIndex == index})
    }
    
    func isThereIsWinner(){
        if (moves[0]?.indicator == moves[1]?.indicator) && (moves[2]?.indicator == moves[0]?.indicator) && moves[0]?.indicator != nil{
            v1 = 0
            v2 = 1
            v3 = 2
        }
        if (moves[3]?.indicator == moves[4]?.indicator) && (moves[4]?.indicator == moves[5]?.indicator) && moves[3]?.indicator != nil{
            v1 = 3
            v2 = 4
            v3 = 5
        }
        if (moves[6]?.indicator == moves[7]?.indicator) && (moves[7]?.indicator == moves[8]?.indicator) && moves[6]?.indicator != nil{
            v1 = 3
            v2 = 4
            v3 = 5
        }
        if (moves[0]?.indicator == moves[3]?.indicator) && (moves[3]?.indicator == moves[6]?.indicator) && moves[0]?.indicator != nil{
            v1 = 0
            v2 = 3
            v3 = 6
        }
        if (moves[1]?.indicator == moves[4]?.indicator) && (moves[4]?.indicator == moves[7]?.indicator) && moves[1]?.indicator != nil{
            v1 = 1
            v2 = 4
            v3 = 7
        }
        if (moves[2]?.indicator == moves[5]?.indicator) && (moves[5]?.indicator == moves[8]?.indicator) && moves[2]?.indicator != nil{
            v1 = 2
            v2 = 5
            v3 = 8
        }
        if (moves[0]?.indicator == moves[4]?.indicator) && (moves[4]?.indicator == moves[8]?.indicator) && moves[0]?.indicator != nil{
            v1 = 0
            v2 = 4
            v3 = 8
        }
        if (moves[2]?.indicator == moves[4]?.indicator) && (moves[4]?.indicator == moves[6]?.indicator) && moves[2]?.indicator != nil{
            v1 = 2
            v2 = 4
            v3 = 6
        }
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

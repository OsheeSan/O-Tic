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
            if isItDraw() {
                Text("DRAW!")
                    .font(.title).bold()
                    .frame(width: 200)
                    .background(.orange)
                    .cornerRadius(30)
            } else {
                if !isThereAWinner() {
                    Text(whoseTurn == true ? "Player -> X" : "Player -> O")
                        .font(.title).bold()
                }
                if isThereAWinner() {
                    withAnimation(){
                        VStack(spacing: 30){
                            Text("WINNER!")
                                .font(.title).bold()
                                .frame(width: 200)
                                .background(.orange)
                                .cornerRadius(30)
                            Text(whoseTurn == true ? "Player -> O" : "Player -> X")
                                .font(.title).bold()
                        }
                    }
                    
                }
            }
            LazyVGrid(columns: columns, spacing: 40){
                if !isThereAWinner() && !isItDraw() {
                    ForEach(0..<9){ i in
                        withAnimation(){
                            Icon(img: moves[i]?.indicator ?? "")
                        }
                            .onTapGesture {
                                withAnimation(){
                                if isIconEmpty(in: moves, forIndex: i){
                                    moves[i] = Move(player: whoseTurn ? .player1 : .player2, boardIndex: i)
                                    whoseTurn.toggle()
                                    findAWinner()
                                    print(v1, v2, v3)
                                }
                            }
                            }
                    }
                } else if isThereAWinner() {
                    ForEach(0..<9){ i in
                        if (i == v1 || i == v2 || i == v3) && v1 != v2 {
                            withAnimation(){
                                Icon(img: moves[i]?.indicator ?? "")
                                    .padding(3.2)
                                    .background(.green)
                                    .cornerRadius(10)
                            }
                        } else {
                            withAnimation(){
                                Icon(img: moves[i]?.indicator ?? "")
                            }
                        }
                    }
                } else if isItDraw() {
                    ForEach(0..<9){ i in
                            withAnimation(){
                                Icon(img: moves[i]?.indicator ?? "")
                                    .padding(3.2)
                                    .background(.orange)
                                    .cornerRadius(10)
                            }
                    }
                }
            }
        }
        .navigationTitle("GAME")
    }
    
    func isIconEmpty(in moves: [Move?], forIndex index: Int) -> Bool{
        return !moves.contains(where: {$0?.boardIndex == index})
    }
    
    func isThereAWinner() -> Bool{
        return v1 != v2
    }
    
    func isItDraw() -> Bool{
        for i in moves {
            if i?.indicator == nil {
                return false
            }
        }
        return true
    }
    
    func findAWinner(){
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

//
//  LocalGame.swift
//  O-Tic
//
//  Created by admin on 28.10.2022.
//

import Foundation

class LocalGame{
    var moves: [Move?] = Array(repeating: nil, count: 9)
    
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
}

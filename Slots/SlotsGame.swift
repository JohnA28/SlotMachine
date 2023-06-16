//
//  SlotsGame.swift
//  Slots
//
//  Created by John Alban on 3/29/23.
//

import Foundation

class SlotsGame {
    var playerBalance: Int? = 100
   var symbols: [SlotSymbol] = [SlotSymbol.random(), SlotSymbol.random(), SlotSymbol.random()]
    
    
    //gives 3 random symbols and takes away 5 from the balance
    func spin() {
        //guard will check that playerBalance is not nil, if it is nil will return function
        guard var balance = playerBalance else {
            return
        }
        balance -= 5
        symbols = [SlotSymbol.random(), SlotSymbol.random(), SlotSymbol.random()]
        
        let directions = Set(symbols.map { $0.direction })
        let shades = Set(symbols.map { $0.shade })
        let colors = Set(symbols.map { $0.color })
        
        if directions.count == 1 || directions.count == 4 ||
            shades.count == 1 || shades.count == 4 ||
            colors.count == 1 || colors.count == 4 {
            balance += 25
        } else if directions.count == 2 || shades.count == 2 || colors.count == 2 {
            balance += 5
        } else {
            balance += 1
        }
        
        playerBalance = balance
    }
}


extension SlotsGame {
    
    //starts a new game with a balance of 100 and 3 random emojis
    func newGame() {
        playerBalance = 100
        symbols = [SlotSymbol.random(), SlotSymbol.random(), SlotSymbol.random()]
    }
    
}
 

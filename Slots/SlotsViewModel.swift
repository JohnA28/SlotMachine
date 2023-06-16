//
//  SlotsViewModel.swift
//  Slots
//
//  Created by John Alban on 3/29/23.
//

import Foundation

class SlotsViewModel: ObservableObject {
    @Published var model = SlotsGame()
    
    
    //without this, view will not update with the model
    private func updateGame(_ newModel: SlotsGame) {
        model = newModel
        }
    
    
    var SlotSymbols: [SlotSymbol] {
        model.symbols
    }
    
    var playerBalance: Int {
        model.playerBalance!
    }
    
    func spin() {
        model.spin()
        updateGame(model)
    }
    
    func newGame() {
        model.newGame()
        updateGame(model)
    }
    
}

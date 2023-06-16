//
//  SlotSymbols.swift
//  Slots
//
//  Created by John Alban on 3/29/23.
//

import Foundation

struct SlotSymbol {
    var direction: Directions
    var shade: Shades
    var color: Colors

    
    enum Directions: CaseIterable {
           case up
           case down
           case left
           case right
           
        static var all = [Directions.up, .down, .left, .right]
    }
       
       enum Shades: CaseIterable {
           case outlined
           case shaded
           case filled
           
           static var all = [Shades.outlined, .shaded, .filled]
       }
       
       enum Colors: CaseIterable {
           case red
           case green
           case purple
           case blue
           
        static var all = [Colors.red, .green, .purple, .blue]
       }
    
    var symbol: String {
        switch (direction, shade) {
        case (.up, .filled): return "▲"
        case (.up, .shaded): return "▲"
        case (.right, .filled): return "▶"
        case (.right, .shaded): return "▶"
        case (.down, .filled): return "▼"
        case (.down, .shaded): return "▼"
        case (.left, .filled): return "◀"
        case (.left, .shaded): return "◀"
        case (.up, .outlined): return "△"
        case (.right, .outlined): return "▷"
        case (.down, .outlined): return "▽"
        case (.left, .outlined): return "◁"
        }
    }
        
        //used to randomize the slot machine emojis
        static func random() -> SlotSymbol {
            let randomDirection = Directions.all.randomElement()!
            let randomShade = Shades.all.randomElement()!
            let randomColor = Colors.all.randomElement()!
            
            return SlotSymbol(direction:randomDirection, shade:randomShade, color:randomColor)
       }
    
    init(direction: Directions, shade: Shades, color: Colors) {
           self.direction = direction
           self.shade = shade
           self.color = color
       }
}

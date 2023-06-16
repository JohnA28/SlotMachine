//
//  ContentView.swift
//  Slots
//
//  Created by John Alban on 3/29/23.
//

import SwiftUI

struct SlotsView: View {
    @ObservedObject var viewModel: SlotsViewModel
    
    var body: some View {
        VStack {
            Text("Balance $\(viewModel.playerBalance)")
                .font(.headline)
                .padding(.top)
            HStack {
                SlotView(symbol: viewModel.SlotSymbols[0])
                SlotView(symbol: viewModel.SlotSymbols[1])
                SlotView(symbol: viewModel.SlotSymbols[2])
            }
            .padding()
            
            Button(action: viewModel.spin) {
                Text("Spin")
                    .foregroundColor(.white)
                    .padding()
                    .background(viewModel.playerBalance < 5 ? Color.gray : Color.blue)
                    .cornerRadius(10)
            } //will disable button if balance is less than 5
            .disabled(viewModel.playerBalance < 5)
            
            Button(action: viewModel.newGame) {
                Text("New Game")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct SlotView: View {
    let symbol: SlotSymbol
    
    //displays symbols
    var body: some View {
        Text(symbol.symbol)
            .font(.system(size: 60))
            .opacity(symbol.shade == .shaded ? 0.4:0.8)
            .foregroundColor(getColor())
            .cornerRadius(10)
    }
    
    //used to get color for symbol
    private func getColor() -> Color {
        switch symbol.color {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        case .blue:
            return Color.blue
        }
    }
}
struct symbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60))
            .foregroundColor(.white)
            .background(Color.pink)
            .cornerRadius(10)
    }
}

extension View {
    func symbolStyle() -> some View {
        self.modifier(symbolModifier())
    }
}

struct SlotsView_Previews: PreviewProvider {
    static var previews: some View {
        SlotsView(viewModel: SlotsViewModel())
    }
}

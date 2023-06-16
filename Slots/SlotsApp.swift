//
//  SlotsApp.swift
//  Slots
//
//  Created by John Alban on 3/29/23.
//

import SwiftUI

@main
struct SlotsApp: App {
    var body: some Scene {
        WindowGroup {
            SlotsView(viewModel: SlotsViewModel())
        }
    }
}

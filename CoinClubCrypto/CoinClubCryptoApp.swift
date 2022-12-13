//
//  CoinClubCryptoApp.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI

@main
struct CoinClubCryptoApp: App {
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                             persistenceController.container.viewContext)
        }
    }
}

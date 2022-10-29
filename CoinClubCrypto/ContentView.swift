//
//  ContentView.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    var NativeCoins: [String] = [
        "XDC", "XRP", "XLM" ,"Algo","l","3","4","5","6","7"
    ]
    
    var ABCs:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    @State var selectTab:Int = 0
    @State var total:Int = 12345
    @State var selectOmniDex:Bool = false
    @State var searchContacts:String = ""
    @State var searchLedger:String = ""
    @State var traderMode:Bool = false
    
    @State var walletExpand: Bool = false
    @State var showSendScreen:Bool = false
    
    @State var sendScreen: Send = Send(
        self_address: "0x0000000000000000000000000000000000000000",
        send_address: "0x0000000000000000000000000000000000000000",
        amount: 0,
        Token: "N/A",
        includeFee: false)
    
    @State var backgroundColor:LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("Prime1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    //MARK: Main App
    var body: some View {
        
            TabView(selection: $selectTab, content: {
                Wallets(
                    backgroundColor: $backgroundColor,
                    total: $total,
                    selectOmniDex: $selectOmniDex,
                    traderMode: $traderMode,
                    walletExpand: $walletExpand,
                    sendScreen: $sendScreen,
                    showSendScreen: $showSendScreen)
                    .tabItem{
                    Image(systemName: "house.fill")
                    Text("Wallet")
                }
                .tag(0)
                
                Ledger(backgroundColor: $backgroundColor, searchLedger: $searchLedger)
                    .tabItem{
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Ledger")
                    }
                    .tag(1)
                
                DAppStore(backgroundColor: $backgroundColor)
                    .tabItem{
                        Image(systemName: "plus.app")
                        Text("DApps")
                    }
                    .tag(2)
                
                Contacts(backgroundColor: $backgroundColor, searchLedger: $searchLedger)
                    .tabItem{
                        Image(systemName: "book.fill")
                        Text("Contacts")
                    }
                    .tag(3)
                
                //MARK: Settings
                Settings(traderMode: $traderMode, backgroundColor: $backgroundColor)
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(4)
            })
            .accentColor(.accentColor)
    }
}
//MARK: Content View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

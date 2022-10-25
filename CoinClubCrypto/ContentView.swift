//
//  ContentView.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var Coin: [String] = [
        "XDC", "XRP", "XLM" ,"Algo","l","3","4","5","6","7"
    ]
    
    @State var selectTab:Int = 0
    @State var total:Int = 12345
    @State var selectOmniDex:Bool = false
    @State var searchContacts:String = ""
    @State var traderMode:Bool = false
    
    @State var walletExpand: Bool = false
    
    @State var backgroundColor:LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("Prime1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //MARK: Main App
    var body: some View {
        
            TabView(selection: $selectTab, content: {
                wallets.tabItem{
                    Image(systemName: "house.fill")
                    Text("Wallet")
                }
                .tag(0)
                
                DApps.tabItem{
                        Image(systemName: "applescript.fill")
                        Text("DApps")
                    }
                    .tag(1)
                
                ContactBook.tabItem{
                        Image(systemName: "book.fill")
                        Text("Contacts")
                    }
                    .tag(2)
                
                Settings.tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(3)
                
            })
            .accentColor(.green)
    }
    
    //MARK: Functions
    
    
    
    //MARK: Wallets
    var wallets: some View {
        
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                
                Text("$\(total)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width: .infinity, height: selectOmniDex ? 550:100)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .shadow(radius: 10)
                    

                    
                    Toggle("", isOn: $traderMode)
                        .padding(.trailing,selectOmniDex ? 45:0)
                        .padding(.bottom,selectOmniDex ? 470:0)
                        .opacity(selectOmniDex ? 100:0)
                    
                    VStack (alignment: .center){
                        Button(action: {
                            withAnimation(.default){
                                selectOmniDex.toggle()
                            }
                        }, label: {
                            VStack {
                                Image(systemName: "rectangle.2.swap")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30, alignment: .top)
                                    .padding(.leading,selectOmniDex ?  30:0)
                                    .padding()
                                //.background(Color.black)
                            }
                            
                            //.background(Color.black)
                        if selectOmniDex{
                            Spacer()
                        }
                        })
                        if selectOmniDex{
                            Spacer()
                        }
                        
                        
                        //MARK: Token Swap DApp
                        if selectOmniDex{
                            
                            SWAP()
                        }
                    }
                }
                
                Spacer()
                
                ScrollView {
                    ScrollViewReader { proxy in
                    ForEach(0..<17){index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: walletExpand ? 578:100)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .shadow(radius: 10)
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 40)
                                        .foregroundColor(.white)
                                        .padding(.top,walletExpand ? 65:20)
                                    
                                    Text("XDC")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                VStack {
                                    HStack {
                                        Button(action: {
                                            withAnimation(.spring()){
                                                walletExpand.toggle()
                                                proxy.scrollTo(index, anchor: .top)
                                            }
                                        }, label: {
                                            Image(systemName: "circle.grid.3x3.circle")
                                                .foregroundColor(.white)
                                        })
                                        
                                        Spacer()
                                        
                                        Text("Test wallet \(index)")
                                            .foregroundColor(.white)
                                            .frame(width: .infinity, alignment: .center)
                                            .font(.title2)
                                            .padding(.top,5)
                                            .bold()
                                        
                                        Spacer()
                                        
                                        Image(systemName: "paperplane.fill")
                                            .foregroundColor(.blue)
                                    }
                                    
                                    
                                    HStack {
                                        Spacer()
                                        Text("xdc76f33784...e267a70f")
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                            .foregroundColor(.white)
                                            .textSelection(.enabled)
                                        
                                        Image(systemName: "qrcode")
                                            .foregroundColor(.blue)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("143,246")
                                        .foregroundColor(.white)
                                        .padding(.leading, 200)
                                        .bold()
                                    
                                    Text("$15,245")
                                        .foregroundColor(.white)
                                        .padding(.leading, 200)
                                    
                                }
                                .padding(.bottom,5)
                                //.background(Color.green)
                            }
                            .padding(.leading, 35)
                            .padding(.trailing, 35)
                            
                        }
                        .id(index)
                    }
                    }
                }
                
                //MARK: OmniDex Wallet Bar
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                        .frame(width: .infinity, height: selectOmniDex ? 110:0)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, selectOmniDex ? 60:0)
                    HStack {
                        VStack {
                            Circle()
                                .frame(width:selectOmniDex ?  50:0 , height: selectOmniDex ? 50:0, alignment: .trailing)
                            Text("XDC")
                        }
                        .padding(.bottom, selectOmniDex ? 55:0)
                        .padding(.leading, selectOmniDex ? 30:0)
                        .shadow(radius: 10)
                        .opacity(selectOmniDex ? 100:0)
                        
                        
                        ZStack{
                            VStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 310, height: selectOmniDex ? 50:0)
                                    .padding(.bottom,5)
                                HStack {
                                    Text("xdc76f33784...e267a70f")
                                    Image(systemName: "equal.circle")
                                    
                                }
                                .padding(.bottom,selectOmniDex ? 55:0)
                                .frame(width: 250, height: selectOmniDex ? 50:0)
                                .opacity(selectOmniDex ? 100:0)
                                .animation(.easeInOut)
                            }
                        }
                        Spacer()
                        

                                                    
                    }
                }
            }
        }
    }
    
    //MARK: DApps
    var DApps: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("DApps")
        }
    }
    
    //MARK: ContractBook
    var ContactBook: some View {
        
        NavigationView {
            BookPage
                .navigationTitle("My Contacts")
                .navigationBarItems(trailing:
                    Button (action: {
 
                    }) {
                        Image(systemName: "plus")
                    }
                )
        }
    }
    
    //MARK: Bookpage
    var BookPage: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                TextField("Search...", text: $searchContacts)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                Spacer()
                ScrollView{
                    ForEach(0..<10){ index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 50, alignment: .center)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            
                            HStack {
                                Text("S")
                                    .foregroundColor(.white)
                                    .padding(.leading, 30)
                                    .padding(.trailing, 30)
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .padding(.leading, 30)
                                    .padding(.trailing, 30)
                            }
                        }
                    }
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                        .frame(width: .infinity,height: 0)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
  
                }
            }
        }
    }
    
    //MARK: Settings
    var Settings: some View {
            ZStack {
                backgroundColor
                    .ignoresSafeArea(.all)
                Text("Settings")
            }
    }
}

//MARK: SWAP DApp
struct SWAP: View {
    var body: some View {
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 70, alignment: .center)
                HStack {
                    Text("XDC")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("amount")
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding(.leading,100)
                .padding(.trailing,100)
            }
            
            Image(systemName: "arrow.triangle.swap")
                .frame(width: .infinity, height: 20)
                .padding(20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 70, alignment: .center)
                
                HStack {
                    HStack {
                        Text("PLI")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("amount")
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                        
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.leading,100)
                    .padding(.trailing,100)
                }
            }
            Spacer()
            
            ZStack{
                VStack {
                    Text("SWAP")
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                        .background(Color.black)
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 70, height: 40, alignment: .center)
                        
                        Text("DEX")
                            .foregroundColor(.white)
                    }
                    
                }

                
            }
            Spacer()
            
            HStack {
                Image(systemName: "arrow.down.app")
                Spacer()
                Image(systemName: "gear")
            }
            .padding(.trailing,30)
            .padding(.leading,30)
            .padding(.bottom,10)
        }
    }
}


//MARK: Content View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

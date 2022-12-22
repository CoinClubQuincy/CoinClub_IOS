//
//  Wallets.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct Wallets: View {
    
    @Binding var backgroundColor:LinearGradient
    @Binding var total:Int
    @Binding var selectOmniDex:Bool
    @Binding var traderMode:Bool
    @Binding var walletExpand: Bool
    @Binding var sendScreen: Send
    @Binding var showSendScreen:Bool
    
    var allAccounts: [String] = [
    "XDC","XRP","XLM","ETH","AAVE","MATIC","COSMO"
    ]
    
    var body: some View {
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
                                    .foregroundColor(.black)
                                    .padding(.leading,selectOmniDex ?  30:0)
                                    .padding()
                                //.background(Color.black)
                            }
                            //.background(Color.black)
                        if selectOmniDex{
                            Spacer()
                            Spacer()
                        }})
                        //MARK: Token Swap DApp
                        if selectOmniDex{
                            SWAP()
                        }
                    }
                }
                Spacer()
            
                VStack {
                    List{
                        ForEach(0..<allAccounts.count){index in
                            Account(name: allAccounts[index])
                                .listRowBackground(backgroundColor)
                                .listRowSeparator(.visible)
                        }
                        .onDelete(perform: {IndexSet in
                            
                            
                        })
                        //.onMove(perform: move)
                        
                        
                    }
                    .listStyle(.inset)
                }
                
//                ScrollView {
//                    ScrollViewReader { proxy in
//                    ForEach(0..<17){index in
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: .infinity, height: walletExpand ? 580:100)
//                                .padding(.leading, 20)
//                                .padding(.trailing, 20)
//                                .shadow(radius: 10)
//                            HStack {
//                                VStack {
//                                    Circle()
//                                        .frame(width: 40)
//                                        .foregroundColor(.white)
//                                        .padding(.top,walletExpand ? 65:20)
//
//                                    Text("XDC")
//                                        .foregroundColor(.white)
//                                    Spacer()
//                                }
//                                VStack {
//                                    HStack {
//                                        Button(action: {
//                                            withAnimation(.spring()){
//                                                walletExpand.toggle()
//                                                proxy.scrollTo(index, anchor: .top)
//                                            }
//                                        }, label: {
//                                            Image(systemName: "circle.grid.3x3.circle")
//                                                .foregroundColor(.white)
//                                        })
//                                        Spacer()
//
//                                        Text("Test wallet \(index)")
//                                            .foregroundColor(.white)
//                                            .frame(width: .infinity, alignment: .center)
//                                            .font(.title2)
//                                            .padding(.top,5)
//                                            .bold()
//
//                                        Spacer()
//                                        Spacer()
//
//                                        Button(action: {
//                                            showSendScreen.toggle()
//                                            sendScreen = Send(
//                                                self_address: "",
//                                                send_address: "",
//                                                amount: index,
//                                                Token: "",
//                                                includeFee: false)
//
//                                        }) {
//                                            Image(systemName: "paperplane.fill")
//                                                .foregroundColor(.blue)
//                                        }
//                                        .sheet(isPresented: $showSendScreen, content: {
//
//                                            SendScreen(
//                                                backgroundColor: $backgroundColor,
//                                                sendCrypto: $sendScreen)
//                                        })
//                                    }
//
//                                    HStack {
//                                        Spacer()
//                                        Text("xdc76f33784f9dcd73...bee267a70f")
//                                            .background(Color.blue)
//                                            .cornerRadius(5)
//                                            .foregroundColor(.white)
//                                            .textSelection(.enabled)
//
//                                        Image(systemName: "qrcode")
//                                            .foregroundColor(.blue)
//                                    }
//                                   Spacer()
//
//                                    Text("$15,245")
//                                        .foregroundColor(.white)
//                                        .padding(.leading,walletExpand ?  100:220)
//                                        .font(walletExpand ? .largeTitle:.title2)
//                                        .bold()
//                                }
//                                .padding(.bottom,5)
//                                //.background(Color.green)
//                            }
//                            .padding(.leading, 35)
//                            .padding(.trailing, 35)
//
//                        }
//                        .id(index)
//                    }
//                    }
//                }
                OmniBarWallet(
                    backgroundColor: $backgroundColor,
                    selectOmniDex: $selectOmniDex)
            }
        }
    }
    
    
    mutating func delete(indexSet: IndexSet){
        allAccounts.remove(atOffsets: indexSet)
    }
    mutating func move(indices: IndexSet,newOffset: Int){
        allAccounts.move(fromOffsets: indices,
                   toOffset: newOffset)
    }
    mutating func add(){
        allAccounts.append("Coconut")
    }
    
}

struct Account: View {
    var name:String
    
    var body: some View {
        HStack {
            HStack {
                VStack {
                        Circle()
                            .frame(width: 40)
                        Text(name)
                        .font(.caption)
                    }
                
                
                
                VStack {
                        Text("xdc000...000")
                            .padding(.horizontal)
                            .bold()
                            .frame(height: 40)
                            .foregroundColor(.black)
                            .background(Color.white
                            .cornerRadius(10))
                    HStack{
                        Text("$1.123")
                            .font(.caption)
                            .bold()
                        Text("+1.43%")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                }
                Spacer()
            }
            VStack{
                Text("9,999,999")
                    .font(.title)
                    .bold()
                Text("$99")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}


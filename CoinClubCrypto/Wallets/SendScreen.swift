//
//  SendScreen.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/27/22.
//

import SwiftUI

struct Token: Identifiable {
    let id = UUID().uuidString
    let network: String
    let token: String
    var amount:Int
}

struct Send: Identifiable {
    let id = UUID().uuidString
    let self_address: String
    let send_address: String
    let amount:Int
    let Token:String
    let includeFee:Bool
}

struct SendScreen: View {
    
    @Binding var backgroundColor:LinearGradient
    @Binding var sendCrypto: Send
    @State var isComplete:Bool = false
    @State var isPassed:Bool = false
    
    
    var body: some View{
        ZStack{
            backgroundColor
                .ignoresSafeArea(.all)
            VStack{
                Text(sendCrypto.Token)
                Text(sendCrypto.self_address)
                Text(sendCrypto.send_address)
                Text("\(sendCrypto.amount)")
                
                
                Text("Token")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Text("from")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Text("to")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Text("amount")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                
                Spacer()
                send
            }
        }
    }
    var send: some View {
        VStack{
            Rectangle()
                .fill(isPassed ? Color.green:Color.blue)
                .frame(maxWidth: isComplete ?  .infinity:0)
                .frame(height: 10)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
                .padding(.horizontal)
            
            
            HStack {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .onLongPressGesture(
                        minimumDuration: 1,
                        maximumDistance: 50) { (isPressing) in
                        // start of press to min duration
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)){
                                    isComplete = true
                                }
                            }else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                    if !isPassed {
                                        withAnimation(.easeInOut){
                                            isComplete = false
                                        }
                                    }
                                }
                            }
                        } perform: {
                            // at min duration
                            withAnimation(.easeInOut){
                                isPassed = true
                            }
                        }
                
//                Text("Reset")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(10)
//                    .onLongPressGesture{
//                        isComplete = false
//                        isPassed = false
//                    }
                
                
            }
        }
    }
}


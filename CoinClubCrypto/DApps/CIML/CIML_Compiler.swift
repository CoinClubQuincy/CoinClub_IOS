//
//  CIML_Compiler.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/5/22.
//

import SwiftUI
import Foundation



struct CIMLFinalView: View {
    let data = Array(1...126).map { "\($0)" }
    let layout = [
        GridItem(.adaptive(minimum: 30))
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 700)
                .frame(maxWidth: .infinity)
                .foregroundColor(.yellow)
            
            VStack {
                LazyVGrid(columns: layout, spacing: 20){
                    ForEach(data, id: \.self){item in
                            Rectangle()
                                .frame(width: 30,height: 30)
                                .foregroundColor(.black)
                                .overlay{
                                    Text("\(item)")
                                        .foregroundColor(.white)
                                }
                        
                                .overlay{
                                    Overlay(cordinates: Int(item)!)
                                }

                    }
                }
                .padding()
            }
        }
        .frame(height: 750)
        .frame(maxWidth: .infinity)
        .padding(10)
        .overlay{
            
        }
    }
}


struct Overlay: View{
    var finalTextList:[TEXT] = []
    var finalTextFieldList:[TEXT_FIELD] = []
    var finalButtonList:[BUTTON] = []
    var finalsysImageList:[SYSIMAGE] = []
    var cordinates:Int
    
    var body: some View{
        ZStack {
            object
        }
    }
    
    var object: some View{
        Circle()
            .fill(Color.blue)
            .frame(width: 35,height: 35)
            .overlay(
                Text("2")
                    .font(.headline)
                    .foregroundColor(.white)
            )
            .overlay(cordinates = 1 ? object : nil)
        
    }
    
    func buildObjects(){
        
        
        
    }
    
    mutating func buildText(text:String,foreGroundColor:Color,font:Font,frame:[CGFloat],alignment:Alignment,backgroundColor:Color,cornerRadius:CGFloat,bold:Bool,fontWeight:Font.Weight,shadow:CGFloat,padding:CGFloat,location:Int){
        
        finalTextList.append( TEXT(text: text, foreGroundColor: foreGroundColor, font: font, frame: frame, alignment: alignment, backgroundColor: backgroundColor, cornerRadius: cornerRadius, bold: bold, fontWeight: fontWeight, shadow: shadow, padding: padding,location: location))
    }
}

struct TEXT: View {
    var text:String
    var foreGroundColor:Color
    var font:Font
    var frame:[CGFloat]
    var alignment:Alignment
    var backgroundColor:Color
    var cornerRadius:CGFloat
    var bold:Bool
    var fontWeight:Font.Weight
    var shadow:CGFloat
    var padding:CGFloat
    var location:Int

    var body: some View {
        Text(text)
            .foregroundColor(foreGroundColor)
            .font(font)
            .frame(width: frame[0], height: frame[1], alignment: alignment)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .bold(bold)
            .fontWeight(fontWeight)
            .shadow(radius: shadow)
            .padding(padding)
    }
}
struct TEXT_FIELD:View{
    private var text:String
    @State var textField:String = ""
    private var foreGroundColor:Color
    private var frame:[CGFloat]
    private var alignment:Edge.Set
    private var backgroundColor:Color
    private var cornerRadius:CGFloat
    private var shadow:CGFloat
    private var padding:CGFloat = 20
 
    var body: some View {
        TextField(text, text: $textField)
            .frame(maxWidth: frame[0])
            .frame(height: frame[1])
            .foregroundColor(foreGroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(alignment,padding)
            .shadow(radius: shadow)
        
    }
}
struct SYSIMAGE:View{
    private var sysname:String
    private var frame:[CGFloat]
    private var padding:CGFloat = 20
    
    var body: some View {
        ZStack {
            Image(systemName: sysname)
                .resizable()
                .scaledToFit()
        }
        .frame(width: frame[0])
        .padding(padding)
    }
}

struct BUTTON:View{
    
    private var label:AnyView
    private var type:String
    var body: some View {
        Button(action: {
            //Types:
            //Toggle Button
            //Submit Function
            //Segue
        }, label: {
            label
        })
    }
}


struct CIML_Compiler_Previews: PreviewProvider {
    static var previews: some View {
        CIMLFinalView()
    }
}

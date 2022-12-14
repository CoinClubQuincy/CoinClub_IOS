//
//  CIML_Compiler.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/5/22.
//

import SwiftUI
import Foundation


//MARK: Final View
struct CIMLFinalView: View {
    @State var gridStatus:Bool = false
    @State var gridPlotView:Color = .black
    @State var gridNumberView:Color = .white
    
    
    let data = Array(1...126).map { "\($0)" }
    let layout = [
        GridItem(.adaptive(minimum: 30))
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 690)
                .frame(maxWidth: .infinity)
                .foregroundColor(.yellow)
                .onAppear{
                    //Color or Gradient
                }
            
            VStack {
                LazyVGrid(columns: layout, spacing: 20){
                    ForEach(data, id: \.self){item in
                        ZStack {
                            Circle()
                                .frame(width: 30,height: 30)
                                .foregroundColor(gridPlotView)
                                .overlay{
                                    Text("\(item)")
                                        .foregroundColor(gridNumberView)
                                }
                        }
                        .overlay{
                            Overlay(cordinates: Int(item)!)
                        }
                        .onAppear{
                            gridPlotStatus()
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
    func gridPlotStatus(){
        if(gridStatus){
            gridPlotView = .black
            gridNumberView = .white
        } else {
            gridPlotView = .clear
            gridNumberView = .clear
        }
    }
    
}

//MARK: OverLay View
struct Overlay: View{
    @StateObject var vmCIML = DownloadCIMLDocument()
    var test:Double = 1.0
    
    @State var finalTextList:[CIMLText] = []
    @State var finalTextFieldList:[CIMLTextField] = []
    @State var finalButtonList:[CIMLButton] = []
    @State var finalsysImageList:[CIMLSYSImage] = []
    var cordinates:Int
    
    var body: some View{
        
        ZStack {
            ForEach(finalTextList) { list in
                if cordinates == list.location {
                    TEXT(text: list.text, foreGroundColor: list.foreGroundColor, font: list.font,
                         frame: list.frame, alignment: list.alignment, backgroundColor: list.backgroundColor,
                         cornerRadius: list.cornerRadius, bold: list.bold, fontWeight: list.fontWeight,
                         shadow: list.shadow, padding: list.padding, location: list.location)
                }
            }
            
            ForEach(finalTextFieldList){ list in
                if cordinates == list.location {
                    TEXT_FIELD(text: list.text, textField: list.textField, foreGroundColor: list.foreGroundColor, frame: list.frame,
                            alignment: list.alignment, backgroundColor: list.backgroundColor,
                               cornerRadius: list.cornerRadius, shadow: list.shadow,padding: list.padding ,location: list.location)
                }
            }
            ForEach(finalsysImageList){ list in
                if cordinates == list.location {
                    SYSIMAGE(sysname: list.name, frame: list.frame, padding: list.padding, color: .black, location: list.location)
                }
            }
            ForEach(finalButtonList){ list in
                if cordinates == list.location {
                    BUTTONS(text: list.text, isIcon: list.isIcon, foreGroundColor: list.foreGroundColor, font: list.font,
                            frame: list.frame, alignment: list.alignment, backgroundColor: list.backgroundColor,
                            cornerRadius: list.cornerRadius, bold: list.bold, fontWeight: list.fontWeight,
                            shadow: list.shadow, padding: list.padding, location: list.location)
                }
            }
        }
        .onAppear {
            finalTextList.append(CIMLText(text: "Exit",font: .title, frame: [100,50], location: 119))
                finalTextList.append(CIMLText(text: String("This is a header" ?? "no name"),font: .largeTitle,frame: [300,50], location: 5))
                finalTextFieldList.append(CIMLTextField(text: "enter text",textField: "",foreGroundColor: .black, location: 32))
                finalsysImageList.append(CIMLSYSImage(name: "clipboard",padding: 0, location: 90))
                finalButtonList.append(CIMLButton(text: "gear",isIcon: true,font: .title, location: 1))
            
            print("total finalTextList: ",finalTextList.count)
            print("total TextField: ",finalTextFieldList.count)
            print("total finalsysImageList: ",finalsysImageList.count)
            print("total finalButtonList: ",finalButtonList.count)
            print("total CIML Data from internet: \(vmCIML.ciml.count)")
        }
    }
        func buildObjects(){}
    
        mutating func buildText(text:String,foreGroundColor:Color,font:Font,frame:[CGFloat],alignment:Alignment,backgroundColor:Color,cornerRadius:CGFloat,bold:Bool,fontWeight:Font.Weight,shadow:CGFloat,padding:CGFloat,location:Int){
        
        finalTextList.append( CIMLText(text: text, foreGroundColor: foreGroundColor, font: font, frame: frame, alignment: alignment, backgroundColor: backgroundColor, cornerRadius: cornerRadius, bold: bold, fontWeight: fontWeight, shadow: shadow, padding: padding,location: location))
    }
}
//MARK: TEXT View
struct TEXT: View {
    let id: String = UUID().uuidString
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
//MARK: TEXTFIELD View
struct TEXT_FIELD:View{
    var text:String
    @State var textField:String
    var foreGroundColor:Color
    var frame:[CGFloat]
    var alignment:Edge.Set
    var backgroundColor:Color
    var cornerRadius:CGFloat
    var shadow:CGFloat
    var padding:CGFloat
    var location:Int
 
    var body: some View {
        TextField(text, text: $textField)
            .frame(width: frame[0])
            .frame(height: frame[1])
            .foregroundColor(foreGroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(alignment,padding)
            .shadow(radius: shadow)
        
    }
}
//MARK: SYSIMAGE View
struct SYSIMAGE:View{
    var sysname:String
    var frame:[CGFloat]
    var padding:CGFloat
    var color:Color
    var location:Int
    
    var body: some View {
        Image(systemName: sysname)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: frame[0])
            .padding(padding)
        }
}
//MARK: BUTTUNS View
struct BUTTONS:View{
    var text:String
    var isIcon:Bool
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
   //@State var finalButtonLabelList:[CIMLText]
    
    var body: some View {
        ZStack {
            Button(action: {
                //Types:
                //Toggle Button
                //Submit Function
                //Segue
            }, label: {
                if(isIcon){
                    Image(systemName: text)
                        .foregroundColor(foreGroundColor)
                        .frame(width: frame[0], height: frame[1], alignment: alignment)
                        .background(isIcon ? .clear : backgroundColor)
                        .shadow(radius: shadow)
                        .padding(padding)
                } else{
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
            })
        }
    }
}

//MARK: PreView
struct CIML_Compiler_Previews: PreviewProvider {
    static var previews: some View {
        CIMLFinalView()
    }
}

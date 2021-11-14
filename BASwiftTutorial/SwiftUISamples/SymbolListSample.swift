//
//  SymbolListSample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 24.10.2021.
//


import SwiftUI


var colorList : [Color] = [.red, .pink, .purple, .yellow, .black, .gray, .orange]

struct SymbolListSample: View {
    var body: some View {
       
        let symbolList = (0..<symbols.count)
        
        NavigationView{
                List(symbolList){ x in
                  NavigationLink(
                    destination: DetailPage(symbolName: symbols[x]),
                    label: {
                        symbolItem(symbol: symbols[x])
                    })
                }
                .navigationTitle("Symbol List")
                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarTitle("Symbol List", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
        
    }
}


struct symbolItem : View{
    var symbol: String
    
    var body: some View{
        HStack{
            Image(systemName: symbol)
                .foregroundColor(colorList.randomElement())
            Divider()
            Text(symbol)
            Spacer()
        }
    }
}

struct DetailPage: View{
    var symbolName : String
    
    var body: some View{
        Image(systemName: symbolName)
            .foregroundColor(colorList.randomElement())
            .imageScale(.large)
            .padding()
        
        Text(symbolName)
            .font(.headline)
    }
}

struct SymbolListSample_Previews: PreviewProvider {
    static var previews: some View {
        SymbolListSample()
    }
}

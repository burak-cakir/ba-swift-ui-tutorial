//
//  CoinListView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 19.11.2021.
//

import SwiftUI

struct CoinListView: View {
    
    @State var coins : CoinModel = CoinModel()
    
    var coinRepository = CoinRepository()
    
    var body: some View {
        
        VStack{
            
        }
        .onAppear(){
            coinRepository.getAll(){result in
                    coins = result
            }
        }
        
        
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}

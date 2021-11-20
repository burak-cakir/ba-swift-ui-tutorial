//
//  CoinListView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 19.11.2021.
//

import SwiftUI

struct CoinListView: View {
    
    @State var coins : [Coins] =  [Coins]()
    
    var coinRepository = CoinRepository()
    
    var body: some View {
        
        VStack{
            
            List(coins, id:\.uuid ){item in
                Text(item.name)
            }
            
        }
        .onAppear(){
//            coinRepository.getAll(){result in
//                coins = result.data.coins
//            }
            coinRepository.getAllCoins(){ result in
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

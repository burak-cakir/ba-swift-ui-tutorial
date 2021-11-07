//
//  Oyuncu.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import Foundation


class Oyuncu{
    let ad:String
    
    private var _helloMessage : String = "Hello! I am a player!!!"
    
    var helloMessage : String{
        get{
            return self._helloMessage
        }
    }
    
    init(ad:String){
        self.ad = ad
    }
    
    
    func cikis() -> String {
        return "Oyuncu oyundan çıkıyor..."
    }
}

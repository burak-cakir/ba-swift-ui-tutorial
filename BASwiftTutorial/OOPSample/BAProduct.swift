//
//  BAProduct.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import Foundation



class BAProduct{
    
    var name : String = "";
    
    private var _stokAdet: Int = 10
    
    var stokAdet : Int {
        get {
            return self._stokAdet
        }
        set{
            if newValue > 100 || newValue < 1{
                fatalError("Stok hatası!!")
            }
            else{
                self._stokAdet = newValue
            }
      
        }
    }
}


func deneme3(){
    
    var baproduct = BAProduct()
    
    baproduct.stokAdet = 33;
    
    var adet = baproduct.stokAdet;
    
}

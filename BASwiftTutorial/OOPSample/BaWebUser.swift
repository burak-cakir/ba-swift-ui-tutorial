//
//  BaWebUser.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import Foundation


class BAWebUser{
    
    private var _isConfirm: Bool = true;
    private var _country : String = "Türkiye"
    
    
    var country : String{
        get{
           return _country
        }
        set{
            //country set edilebilir FAKAT boş bir değer set edemeZ!!!
            if newValue.isEmpty{
                self._country = "Türkiye"
            }
            else{
                self._country = newValue
            }
          
        }
    }
    
    
    var isConfirm : Bool{
        get{
            return _isConfirm;
        }
        set{
            _isConfirm = newValue
        }
    }
    
}



func onemli(){
    
    var bauser = BAWebUser()
    
    print(bauser.country)
    
    bauser.country = "Almanya"
    
}

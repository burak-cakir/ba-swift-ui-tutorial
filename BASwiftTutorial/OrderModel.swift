//
//  OrderModel.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 3.11.2021.
//

//Gelen data ile match olacak ekran görüntüsü modelim


import Foundation


struct OrderModel: Codable, Identifiable{
    
    var id : Int = 0
    var shipName : String = ""
    var shipAddress: ShipAddress?

}


struct ShipAddress: Codable{
    var street : String
    var city : String
}

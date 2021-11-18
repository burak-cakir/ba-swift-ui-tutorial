//
//  OrdeModel.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 18.11.2021.
//

import Foundation

struct OrderViewModel : Codable, Identifiable
{
    var id : Int = 0;
    var shipName : String = "";
    var customerId : String = ""
    var shipAddress : Address = Address()
    var details : [Detail] = [Detail]()
}



struct Address : Codable {
    var street: String = ""
    var city : String = ""
    var region : String = ""
}


struct Detail : Codable {
    var productId : Int = 0;
    var unitPrice = 0.0;
    var quantity : Int = 0;
}


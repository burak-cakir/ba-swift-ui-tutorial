//
//  Product.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 9.10.2021.
//

import Foundation

struct Product {
    
    var id = UUID()
    var productName : String
    var unitInStock : Int
    var description : String
    //price int asla olmaz. para formatında olmalı. extension yazıp sonra yöneteceğiz
    var price : Int = 0
    var isActive : Bool = true
    
//    var category : Category = Category(name: "...", code: "...", topCategory: nil)
    
}

//
//  Ninja.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import Foundation


class Ninja{
    
    //property - Class içerisindeki property lerin default olarak bir değere sahip olması lazım. Değeri dilerseniz property oluştuğu anda verebilirsiniz VEYA init metodunda propery doldurma zorunluluğu verirsiniz
    //let değişkeni değiştirilemediği için init metodunda tanımladım
    let ad : String
    let sehir : String
    
    var kilicTur : String = ""
    var ulke = ""
    
    init(ad:String, sehir:String){
        self.ad = ad
        self.sehir = sehir
    }

}


struct Kisi{
    
    var ad : String = "Faik"
    var ulke = ""
    
}



func merhaba(){
    
//    var ninja = Ninja(ad: "Çağatay", sehir: "İstanbul")
//
//    var kisi = Kisi()
//
//    kisi.ad = "Sibel"
//    kisi.ulke = "Türkiye"
//
//    var kisi2 = Kisi(ad: "Orkun", ulke: "Almanya")

}



//struct Kisi{
//    let name : String
//}

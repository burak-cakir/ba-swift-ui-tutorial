//
//  SwiftUIOOPView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import SwiftUI

struct SwiftUIOOPView: View {
    
    // Ninja class ından bir tane instance ALDIM
    var ninja = Ninja(ad: "Çağatay",sehir: "İstanbul")
    var ninja2 = Ninja(ad: "Orkun", sehir: "İzmir")
    
//    var samuray = Samuray(yildizTur: "8 li yıldız")
   
    // Kisi struct ımdan bir tane oluşutrdum
//    var kisi = Kisi(ad: <#T##String#>, ulke: <#T##String#>)
    
    
    
    var body: some View {
        VStack{
            Text("")
//            Text(kisi.ad)
        }

    }
}

struct SwiftUIOOPView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIOOPView()
    }
}

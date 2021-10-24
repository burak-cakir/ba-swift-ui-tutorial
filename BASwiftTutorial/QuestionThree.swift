//
//  QuestionThree.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct QuestionThree: View {
    
//    3 ayrı TextField dan girilen sayıların ortalamasını bir Text e yazdır.
    
    @State var  number1 : String = ""
    @State var number2: String = ""
    @State var number3: String = ""
    @State var result : Double = 0
    
    var body: some View {

        
        VStack{
            
            TextField("Number-1", text:$number1)
            TextField("Number-1", text:$number2)
            TextField("Number-1", text:$number3)
            
            Button("Calc"){
                let total = Int((number1 as NSString).integerValue)  +  Int((number2 as NSString).integerValue)   + Int((number3 as NSString).integerValue)
                
                result = Double(total / 3)
                
            }
            .padding()

            Text(String(result))
                
        }
        .padding()
        
    }
}

struct QuestionThree_Previews: PreviewProvider {
    static var previews: some View {
        QuestionThree()
    }
}

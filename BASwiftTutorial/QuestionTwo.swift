//
//  QuestionTwo.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct QuestionTwo: View {
    
    //Textfield dan girilen sayıyın karesini  bir text e yazdır.
    
    @State var number:String = "0"
    @State var result: Int = 0
    
    
    var body: some View {
        
        VStack{
            
            TextField("number",text:$number)
                .padding()
            
            Button("Çarp"){
                
                //1. yol
               // result = Int(number)! * Int(number)!
                
                //2. yol
//                var x = (number as NSString).integerValue
//                result = x * x
                
               result = Int((number as NSString).integerValue) * Int((number as NSString).integerValue)
                
//                3. yol
//                var x : Int = 0
//
//                if x == Int(number){
//                    x = Int(number)!
//                }
//                else{
//                    x = 0
//                }
//
//                result = x * x
                
//                4. yol
//                 result = Int(Int(number) ?? 0) * Int(Int(number) ?? 0)
    
                
            }
            
            Text(String(result))
                .padding()

            
            
        }
        
    }
}

struct QuestionTwo_Previews: PreviewProvider {
    static var previews: some View {
        QuestionTwo()
    }
}

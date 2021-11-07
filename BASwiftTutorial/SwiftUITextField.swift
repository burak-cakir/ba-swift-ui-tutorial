//
//  SwiftUITextField.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct SwiftUITextField: View {
    

    let name : String = "Çağatay"
    let surname : String = "Yıldız"
    
    @State var city:String = ""
    @State var password:String = ""
    
    
    var body: some View {
        
        VStack{
//            Text(name + " " +  surname.uppercased())
            
            TextField("city",text:$city)
                .padding()
                .foregroundColor(.red)
            
            Text(city)
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            
            
            SecureField("password", text: $password)
                .padding()
            
//            Text(String(Date().timeIntervalSinceReferenceDate))
            
        }
    }
}

struct SwiftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField()
    }
}

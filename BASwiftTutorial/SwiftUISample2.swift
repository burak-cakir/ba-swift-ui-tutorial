//
//  SwiftUISample2.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 16.10.2021.
//

import SwiftUI

struct SwiftUISample2: View {
    var body: some View {

        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Image("cat")
                    .resizable()
                    .frame(width: 400, height: 300)
                    .cornerRadius(40)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
                Spacer()
                    
            }
        }
        
     
    }
}

struct SwiftUISample2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISample2()
    }
}

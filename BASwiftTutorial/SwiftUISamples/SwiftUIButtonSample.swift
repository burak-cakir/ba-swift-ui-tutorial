//
//  SwiftUIButtonSample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct SwiftUIButtonSample: View {
    var body: some View {
        
        
        VStack{
            
            Button("Button - 1"){
                print("Button-1  Clicked! ")
            }
            
            
            Button(action:{
                
            },label:{
                    Text("Button - 2")
            })
            
            Button(action:{}){
                Text("Button - 3")
                    .foregroundColor(.red)
            }

        }
        
    }
}

struct SwiftUIButtonSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButtonSample()
    }
}

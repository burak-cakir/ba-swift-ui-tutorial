//
//  SwiftUIQuestionOne.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct SwiftUIQuestionOne: View {

    //Textfield dan alınan değeri büyülterek ekrana yazdır
    @State var name:String = ""
    
    var body: some View {
        
        VStack{
            TextField("name",text:$name)
                .padding()
            
            Button("to Upper"){
                name = name.uppercased()
            }
            .padding()
            
            
            Text(name)
                .padding()
        }
    }
}

struct SwiftUIQuestionOne_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIQuestionOne()
    }
}

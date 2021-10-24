//
//  SwiftUIImgSample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 26.09.2021.
//

import SwiftUI

struct SwiftUIImgSample: View {
    var body: some View {
        
        Image("koala")
            .aspectRatio(contentMode: .fit)
        
        Image("koala")
            .resizable()
            .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .opacity(0.4)
            .cornerRadius(50)
        
        Image(systemName: "star")
            .foregroundColor(.red)
            .font(.system(size: 60))
        
        
        
          
    }
}

struct SwiftUIImgSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImgSample()
    }
}

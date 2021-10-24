//
//  SwiftUIAlertSample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 24.10.2021.
//

import SwiftUI

struct SwiftUIAlertSample: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        VStack{
         
//            Button("Show Alert"){
//                showingAlert = true
//            }
//            .alert(isPresented: $showingAlert, content: {
//                Alert(title: Text("test"))
//            })
//            .padding()
//
            
            Button("Show Alert - 2"){
                showingAlert = true
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(
                    title: Text("Mesaj Başlığı"),
                    message: Text("Mesaj içeriği"),
                    primaryButton: .destructive(Text("Cancel"), action:{
                        
                    }),
                    secondaryButton: .default(Text("OK"), action:{
                        
                    })
                
                )
            })
            .padding()
            
            

            
            
        }
       
    }
}

struct SwiftUIAlertSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAlertSample()
    }
}


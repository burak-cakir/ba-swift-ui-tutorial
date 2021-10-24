//
//  SwiftUISamples.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 16.10.2021.
//

import SwiftUI

struct SwiftUISamples: View {
    
    
    @State var diseases : String = "0"
    
    var body: some View {
        
        
        VStack{
            
            HStack{
              
                HeaderView()
                
                Spacer()
                
                TitleView()
              
               
            }
        
            
            VStack(alignment: .leading, spacing:18) {

                HStack{
                    Spacer()
                }

                Text("Learn")
                .font(.system(size: 45, weight: .bold))
                    
                Text("Choose the part of the body")
                    .font(.system(size:18))
                
            }
            
            VStack{
                
                BoxModel(title: "Head && Face", diseases: diseases, boxColor: Color("headBoxColor"),systemImageName: "person.fill")
                BoxModel(title: "Back && Neck", diseases: "9 diseases",boxColor:  Color("backBoxColor"),systemImageName: "person.fill")
                BoxModel(title: "Elbow && Shoulders", diseases: "11 diseases",boxColor: Color("elowBoxColor"),systemImageName: "hand.raised.fill")
                BoxModel(title: "Hand && Arm", diseases: "2 diseases",boxColor: Color("handBoxColor"),systemImageName: "hand.raised.fill")
            }
            
            Button("Increase"){
                let result : Int = Int(diseases)! + 1
                diseases = String(result)
            }
       
        
//            .frame(
//                  minWidth: 0,
//                  maxWidth: .infinity,
//                  minHeight: 0,
//                  maxHeight: .infinity,
//                  alignment: .topLeading
//                )
            
            Spacer()
        }
        .padding()
        

        
       
        
      
    }
}



struct SwiftUISamples_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISamples()
    }
}


struct TitleView : View{
    
    var body: some View{
        Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
    }
}


struct HeaderView : View{
    
    
    var body: some View{
        Text("Friday, 15 Dec")
            .foregroundColor(.gray)
    }
}


struct BoxModel: View{
    
        var title:String
        var diseases : String = ""
        var boxColor : Color
        var systemImageName : String


       var body: some View {
        VStack(alignment: .leading){
  
            HStack{
                
                VStack(alignment:.leading){
                    Text(title)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                    Text(diseases + " diseases")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
             
                Image(systemName: systemImageName)
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                    
               }
            
            
            }
        .padding(30)
        .background(boxColor)
        .cornerRadius(30)
        }
 
    
}

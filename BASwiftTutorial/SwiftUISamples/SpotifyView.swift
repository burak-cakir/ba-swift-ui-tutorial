//
//  SpotifyView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 17.10.2021.
//

import SwiftUI
import Foundation



struct SpotifyView: View {
    
    
    let formatter4 = DateFormatter().date(from: "")


    
    
   let now =  Date()
    var musicBoxModels : [MusicModel] = [
        MusicModel(title: "Old scholl metal", imageName: "cat"),
        MusicModel(title: "Liked songs", imageName: "cat"),
        MusicModel(title: "Razor", imageName: "cat"),
        MusicModel(title: "Hail to the King", imageName: "cat"),
        MusicModel(title: "Metal Mode", imageName: "cat")
    ]
    
    let layout = [
            
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    
    var body: some View {
       
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint:.bottom)
                .ignoresSafeArea()
            
            VStack{
                
                Header(title: "Good Morning!")
                HStack{
                    
                    LazyVGrid(columns: layout, spacing:10){
                        ForEach(musicBoxModels, id:\.id){item in
                           
                            musicBoxView(musicModel: item)
                        }
                    }
                    
                    Spacer()
                  
                }
                ReleaseView(groupName: "Epica")
                
                HStack{
                    Image("epicaSong")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading){
                        
                        Text("The Skeleton Key")
                            .foregroundColor(.white)
                        Text("Omega Alive")
                            .foregroundColor(.white)
                        Text("EP Epica")
                            .foregroundColor(.gray)
                        
                        HStack{
                            Image(systemName: "star")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "star")
                                .foregroundColor(.white)
                             
                        }
                        .padding(.top,10)
                    }
                    .padding()
                    Spacer()
                }
                
                Spacer()

            }
            .padding()
        }
        
    }
}

struct SpotifyView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyView()
    }
}


struct Header : View{
    
    var title : String = ""
    
    
    var body: some View{
        
        HStack{
            TitleText(textName: title)
            
            Spacer()
          
            HeaderIcon(iconTitle: "star")
            HeaderIcon(iconTitle: "star")
            HeaderIcon(iconTitle: "star")
       
        }
        
    }
    
}

struct  HeaderIcon : View {
    
    var iconTitle : String = ""
    
    var body: some View{
        
        Image(systemName: iconTitle)
            .foregroundColor(.white)
            .padding(.horizontal,10)
        
    }
    
}

struct musicBoxView : View {
    
    var musicModel : MusicModel
    
    var body: some View{
        
        HStack{
            Image(musicModel.imageName)
                .resizable()
                .frame(width: 50, height: 65)
            
            Text(musicModel.title)
                .foregroundColor(.white)
            Spacer()
        
           
        }
        .frame(width: 150)
        .padding(.trailing,18)
        .background(Color(.gray))
        .cornerRadius(10)

    }
    
}

struct ReleaseView : View{
    
    var groupName : String = ""
    
    var body: some View{
        
        HStack{
            Image("epica")
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading){
                Text("NEW RELEASE FROM")
                    .foregroundColor(.gray)
               TitleText(textName: groupName)
            }
            
            Spacer()
            
            
        }
        .padding(.vertical,20)
        
    }
}


struct MusicModel {
    
   var id = UUID()
   var title:String
   var imageName:String
    
}


struct TitleText: View{
    
    var textName: String = ""
    var body: some View{
        Text(textName)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(.white)
    }
    
}

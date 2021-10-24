//
//  SwiftUINavigationSample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 24.10.2021.
//

import SwiftUI

struct SwiftUINavigationSample: View {
    
    @State var showContactPage = false
    @State var selection : String? = ""
    @State var score = 0
    @State var barHidden : Bool = false
    @State var isShowAlert : Bool = false
    
    
    var body: some View {
        

        NavigationView{
          
            VStack{
                Text("Bilge Adam")
                    .padding()
                
                
//                NavigationLink(destination: DetailView(productName: "iphone..."), label:{
//                    Text("Go to detail page!").padding()
//                })
//
//                NavigationLink(destination: ContactView(), isActive: $showContactPage ){
//
//                }
                
                NavigationLink(destination: FirstView(), tag: "first", selection: $selection){}
                NavigationLink(destination: SecondView(), tag: "second", selection: $selection){}
                
                
                Text("Score \(score)")
                
                Button("Go to first screen!"){
                   isShowAlert = true
                }

                .padding()
                
                Button("Go to second screen!"){
                    selection = "second"
                }
                .padding()
                
                
                
//                Button("Navigate"){
//                    //code...
//                    showContactPage = true
//
//                }
//                .padding()
                
                Button("Bar Hidden"){
                    barHidden.toggle()
                }

                
                
          
            }
            .navigationBarTitle("Home", displayMode: NavigationBarItem.TitleDisplayMode.inline)
//            .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                                    Button("Left") {
//                                       score = score + 1
//                                    }
//                                }
//                    }
            .navigationBarItems(
                leading: Button("Left"){
                    score = score + 1
                },
                trailing: Button("Right"){
                    score = score - 1
                }
            )
            .navigationBarHidden(barHidden)
       
            
        }
        .alert(isPresented: $isShowAlert, content: {
            Alert(
                title: Text("Uyarı"),
                message: Text("Başka bir sayfaya yönlendiriliyorsunuz. Gitmek istediğinize emin misiniz?"),
                primaryButton: .destructive(Text("Cancel"), action:{
                    
                }),
                secondaryButton: .default(Text("OK"), action:{
                    selection = "first"
                })
            
            )
        })

        
    }
}

struct DetailView : View{
    
    var productName : String = ""
    
    var body: some View{
        VStack{
            Text("\(productName) Detail page....")
                .padding()
            
        }
    }
}


struct ContactView : View{
    var body: some View{
        VStack{
            Text("Contact page...")
        }
    }
}


struct FirstView : View {
    var body: some View{
        VStack{
            Text("First View page...")
        }

        
       // .navigationBarBackButtonHidden(true)
    }
}


struct SecondView : View {
    var body: some View{
        
        NavigationView{
            VStack{
                Text("Second View page...")
                
                               NavigationLink(destination: FirstView(), label:{
                                    Text("Go to first view page!").padding()
                                })
            }
           
        }
        
     
    }
}


struct SwiftUINavigationSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationSample()
    }
}

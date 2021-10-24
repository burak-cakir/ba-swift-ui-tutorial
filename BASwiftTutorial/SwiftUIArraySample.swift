//
//  SwiftUIArraySample.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 9.10.2021.
//

import SwiftUI


func getCities() -> [String]{
    return ["sivas","manisa","ankara","erzurum","trabzon","diyarbakır","denizli","kars","antalya","adana","nigde"]
}

struct SwiftUIArraySample: View {
    

    @State var cities : [String]  = getCities()
    
    @State var isSorted : Bool = false
    
    @State var searchData : String = ""
    @State var dataCount : Int = getCities().count
    
    
    
    var body: some View {
        
        VStack{
            
            TextField("search data...", text:$searchData)
                .padding()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            Text("Data count: \(dataCount)" )
            Button("Search"){
                
                if searchData.isEmpty{
                    cities = getCities()
                    dataCount = getCities().count
                }
                else{
                    let filtered = cities.filter{ $0.contains(searchData)}
                    cities = filtered
                    dataCount = filtered.count
                }
            
            }
            .padding()
              
            Button("Sort"){
    
                    if isSorted {
                        cities.reverse()
                    }
                    else{
                        cities.sort()
                        isSorted = true
                    }
            
                
            }
            .padding()
            
            Button("Upper")
            {
                 cities = cities.map{
                    $0.uppercased()
                }
            }.padding()
            
            Button("Lower")
            {
                cities = cities.map{
                    $0.lowercased()
                }
            }
            
            if dataCount == 0{
                Text("Sonuç bulunamadı...")
                    .padding()
            }
            
            List(cities, id:\.self){ x in
                Text(x)
            }
            
            
            
            
            
        }
        
       
        
    }
}

struct SwiftUIArraySample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIArraySample()
    }
}

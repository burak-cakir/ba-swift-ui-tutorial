//
//  SwiftUIFetchOperation2.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 31.10.2021.
//

import SwiftUI
import Foundation

struct SwiftUIFetchOperation2: View {
    
    
    @ObservedObject var fetch = FetchWebUsers()
    
    var body: some View {
        
        Text(String(fetch.webusers.count))
        
//        List(fetch.webusers)
        List(fetch.webusers){ webuser in
            Text(webuser.name)
        }
    }
}

struct SwiftUIFetchOperation2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFetchOperation2()
    }
}


struct WebUserModel : Codable, Identifiable {

    var id : String
    var name : String
    var surname : String
    var email : String
    var phoneNumber : String
//    enum CodingKeys: String, CodingKey{
//        case phoneNumber = "phone"
//    }
}

class FetchWebUsers : ObservableObject {
    
    @Published var webusers = [WebUserModel]()
    
    init() {
        
        let url = URL(string: "http://localhost:3000/api/user")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let webUserData = data {
                    let decodedData = try JSONDecoder().decode([WebUserModel].self, from: webUserData)

                    //DispatchQueue.main.async {
                    self.webusers = decodedData
                    //}
                    
                }
                else{
                    print("No data!")
                }
                
            }
            catch{
                print("Error!")
            }
        }.resume()
        
    }
        
    }


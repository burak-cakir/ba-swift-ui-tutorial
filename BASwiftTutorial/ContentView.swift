

import SwiftUI

struct ContentView: View {
    
   
    var body: some View {
        
        OrderListScreen()
//        AddCategoryView()
//
//        Button("Add"){
//
//
//            let url = URL(string: "https://northwind.vercel.app/api/categories")!
//
//            //Artık bir post işlemi yapacağım için bir URL request oluşturmak zorundayım!!
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//
//            //Request Body
//            let postData = "name=Electronic&description=ElectronicProducts.."
//
//            request.httpBody = postData.data(using: .utf8);
//
//            URLSession.shared.dataTask(with: request){(data,response,error) in
//
//
//                do{
//                    if let error = error{
//                        print("Error \(error)")
//                        return
//                    }
//
//    //                if let data = data, let dataString = String(data:data, encoding: .utf8){
//    //
//    //                    print("Response data\(data)")
//    //                }
//
//                    if let categoryData = data {
//                        let decodedData = try JSONDecoder().decode(CategorySample.self, from: categoryData)
//                        print(decodedData)
//                    }
//
//                }
//                catch{
//                    print("Error")
//                }
//
//
//
//            }
//            .resume()
//
            
//            
//            let url = URL(string: "https://northwind.vercel.app/api/categories")!
//            
//            //Artık bir post işlemi yapacağım için bir URL request oluşturmak zorundayım!!
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            
//            //Request Body
//            let postData = "name=Electronic&description=ElectronicProducts.."
//            
//            request.httpBody = postData.data(using: .utf8);
//            
//            URLSession.shared.dataTask(with: request){(data,response,error) in
//                
//
//                if let error = error{
//                    print("Error \(error)")
//                    return
//                }
//                
//              
//                if let data = data, let dataString = String(data:data, encoding: .utf8){
//                  
//                    print("Response data\(dataString)")
//                }
//                
//            }
//            .resume()
            
        
    }
      
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View { 
        ContentView()
    }
}



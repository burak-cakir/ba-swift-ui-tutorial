//
//  ProductRepository.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import Foundation


class ProductRepository{
    
    func add(productModel: ProductModel, completionHandler: @escaping (ProductModel)->Void){
        
        guard let url = URL(string: "https://northwind.vercel.app/api/products") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "name=\(productModel.name)&discontinued=\(productModel.discontinued)&quantityPerUnit=\(productModel.quantityPerUnit)&unitsInStock=\(productModel.unitsInStock)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            
            do{
                if let returnData = data{
                    let decodeData = try JSONDecoder().decode(ProductModel.self, from: returnData)
                    
                    completionHandler(decodeData)
                    
                }
            }
            catch{
                print("Error!")
            }
        }.resume()
        
        
    }
}




struct ProductModel : Codable {
     var name : String = ""
     var discontinued : Bool = false
     var quantityPerUnit : String = ""
     var unitsInStock: Int = 5
     var categoryId : Int = 1
}




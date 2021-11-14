//
//  CategoryRepository.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import Foundation


class CategoryRepository{
    
    
    //Bu fonksiyon web api ye category ekler. Daha sonra eklenilen kategoriyi (yani servisin döndüğü kategoriyi bana completion Handler olarak verir)
    func add(categoryModel: CategoryModel, completionHandler:  @escaping (CategoryModel)-> Void){
        
        guard let url = URL(string: "https://northwind.vercel.app/api/categories") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "name=\(categoryModel.name)&description=\(categoryModel.description)"
        
        
        request.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            
            do{
                
                if let returnData = data{
                    let decodeData = try JSONDecoder().decode(CategoryModel.self, from: returnData)
                    
                    completionHandler(decodeData)
                    
                    
                }
                
            }
            catch{
                print("Error!")
            }
            
        }.resume()
    }
    
    
}


struct CategoryModel : Codable{
    var name:String = ""
    var description:String = ""
    
}

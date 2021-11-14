//
//  SupplierRepository.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import Foundation


class SupplierRepository{
    
    func getAll(completionHandler: @escaping([SupplierModel]) -> Void){
        
        guard let url = URL(string:  "https://northwind.vercel.app/api/suppliers") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                if let returnData = data{
                    let decodeData = try JSONDecoder().decode([SupplierModel].self, from: returnData)
                    completionHandler(decodeData)
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        
    }
    
    
    
}


struct SupplierModel: Codable{
    var id: Int = 0
    var companyName: String = ""
}

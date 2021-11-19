//
//  OrderRepository.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 18.11.2021.
//

import Foundation


class OrderRepository{
    
    func getAll(completionHandler: @escaping([OrderViewModel]) -> Void){
        
        guard let url = URL(string: "https://northwind.vercel.app/api/orders") else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                
                if let ordersData = data{
                    let decodeData = try JSONDecoder().decode([OrderViewModel].self, from: ordersData)
                    
                    completionHandler(decodeData);
                }
            }
            catch{
                print(error)
            }
            
        }.resume()
        
        
    }
    
    
    func getOrderById(id:Int, completionHandler: @escaping(OrderViewModel) -> Void){
        guard let url = URL(string: "https://northwind.vercel.app/api/orders/\(id)") else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                
                if let ordersData = data{
                    let decodeData = try JSONDecoder().decode(OrderViewModel.self, from: ordersData)
                    
                    completionHandler(decodeData);
                }
            }
            catch{
                print(error)
            }
            
        }.resume()
        
        
    }
}

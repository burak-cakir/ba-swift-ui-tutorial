//
//  OrderManager.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 3.11.2021.
//

//Bu class order get,post,delete,getbyId işlemlerini yönetir. Manager, Controller, NetworkAPI-NetworkController, Business

import Foundation

class OrderManager : ObservableObject
{

    @Published var orders : [OrderModel] = [OrderModel]()
    @Published var order : OrderModel = OrderModel()
    
    func getAll() -> [OrderModel]{
        
      
        //https://northwind.vercel.app/api/orders
        guard let url = URL(string: "https://northwind.vercel.app/api/orders") else{ return [OrderModel]()}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                if let orders = data{
               
                    let decodeData = try JSONDecoder().decode([OrderModel].self , from: orders)
                    
                    self.orders = decodeData
                    
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        return  self.orders;
        
    }
    
    
    func getOrderById(id:Int) -> OrderModel{
        guard let url = URL(string: "https://northwind.vercel.app/api/orders/" + String(id)) else{ return OrderModel()}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                if let order = data{
               
                    let decodeData = try JSONDecoder().decode(OrderModel.self , from: order)
                    
                    DispatchQueue.main.async {
                        self.order = decodeData
                        
                      }
                  
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        return  self.order;
    }
    
}

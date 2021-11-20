//
//  OrderRepository.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 18.11.2021.
//

import Foundation


class CoinRepository{
    
    func getAll(completionHandler: @escaping(CoinModel) -> Void){
        
        guard let url = URL(string: "https://api.coinranking.com/v2/coins") else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                
                if let coinsData = data{
                    let decodeData = try JSONDecoder().decode(CoinModel.self, from: coinsData)
                    
                    completionHandler(decodeData);
                }
            }
            catch{
                print(error)
            }
            
        }.resume()
        
        
    }
    
    func getAllCoins(completionHandler: @escaping([Coins]) -> Void){
        
        guard let url = URL(string: "https://api.coinranking.com/v2/coins") else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                
                if let coinsData = data{
                    let decodeData = try JSONDecoder().decode(CoinModel.self, from: coinsData)
                    
                    completionHandler(decodeData.data.coins);
                }
            }
            catch{
                print(error)
            }
            
        }.resume()
        
        
    }

    }


struct CoinModel : Codable{
    var status: String = ""
    var data : Data = Data()
    
}

struct Data : Codable{
    var stats: Stats = Stats()
    var coins : [Coins] = [Coins]()
}

struct Stats : Codable{
    var total : Int = 0
}

struct Coins : Codable{
    var name : String = ""
    var symbol : String = ""
    var uuid: String = ""
    var sparkline : [String] =  [String]()
}

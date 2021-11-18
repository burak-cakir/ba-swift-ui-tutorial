//
//  OrderListScreen.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 18.11.2021.
//

import SwiftUI

struct OrderListScreen: View {
    
    @State var orders : [OrderViewModel] = [OrderViewModel]()
    var orderRepository = OrderRepository()
    
    var body: some View {
        
        NavigationView{
            
            List(orders){ item in
               
                NavigationLink(
//                    destination: OrderDetailScreen(detailModel: item),
                    destination: OrderDetailScreen2(orderId: item.id),
                    label: {
                        VStack{
                            Text(item.shipName)
                        }
                       
                        
                    })
                
            }
            .onAppear(){
                orderRepository.getAll(){ result in
                    orders = result
                }
            }
            .navigationBarHidden(true)
            
        }
       

        
    }
}

struct OrderListScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderListScreen()
    }
}


//Bu struct dışarıdan aldığı item ı direkt ekrana basıyor
struct OrderDetailScreen : View{
    
    var detailModel : OrderViewModel
    
    var body: some View{
        
        VStack{
            Text(String(detailModel.id))
            Text(detailModel.shipName)
            Text(detailModel.shipAddress.city)
        }
    }
    
}

//Bu struct dışarıdan id alıp servise gidiyor ve servisten aldığı datayı ekrana basıyor.
struct OrderDetailScreen2 : View{
    
    var orderId : Int
    @State var detailModel : OrderViewModel = OrderViewModel()
    var orderRepository : OrderRepository = OrderRepository()
    
    var body: some View{
    
        VStack{
            Text("Screen-2")
            Text(String(detailModel.id))
            Text(detailModel.shipName)
            Text(detailModel.shipAddress.city)
        }
        .onAppear(){
            orderRepository.getOrderById(id: orderId){ result in
                detailModel = result
            }
        }
  
    
    }
    
}


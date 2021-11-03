//
//  OrderListView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 3.11.2021.
//

import SwiftUI

struct OrderListView: View {
    
    @ObservedObject var orderManager = OrderManager()
    
    var body: some View {
        
        NavigationView{

            List(orderManager.getAll()){ order in

                NavigationLink(

                    destination: OrderDetailView(id: order.id),
                    label: {
                        Text(order.shipName)
                    }
                )
                .navigationTitle("Order List")
                .navigationBarTitleDisplayMode(.inline)

            }
        }
        
        
        
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}




struct OrderDetailView: View {
    
    @ObservedObject var orderManager = OrderManager()
    var orderId : Int = 0
    
    init(id:Int) {
        self.orderId = id
    }
    
    init() {
        
    }
    
    
    var body: some View{
        VStack{
            Text(orderManager.getOrderById(id: orderId).shipName)
        }
   
    }
    
}



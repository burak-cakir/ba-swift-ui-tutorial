//
//  ProductList.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 10.10.2021.
//

import SwiftUI

func getProducts() -> [Product]{
    return [
        Product(productName: "IPhone", unitInStock: 10, description: "apple ın telefon ürün...", price: 10000),
        Product(productName: "Samsung", unitInStock: 22, description: "Koreli arkadaşların telefonu..", price:7000),
        Product(productName: "Huawei", unitInStock: 21, description: "Çinli arkadaşların telefonu..", price: 2500),
        Product(productName: "Lenovo", unitInStock: 5, description: "lenovo pc. thinkpadlerinin wifi sinde sorun var", price: 4400),
        Product(productName: "Mac M1", unitInStock: 11, description: "mac m1 işlemci 10  numara ama pahalı", price: 20000)
    ]
}


struct ProductList: View {
    
    
    @State var minPrice : String = ""
    @State var maxPrice : String = ""
    @State var searchByName : String = ""
    @State var searchDataCount : Int = getProducts().count
    @State var isSortedbyName : Bool = false
    @State var isSortedbyPrice : Bool = false
    
    @State var products : [Product] = getProducts()
    
    var body: some View {
        
        VStack{
            
          
            TextField("Min price: ", text:$minPrice)
                .padding()
            
            TextField("Max price: ", text:$maxPrice)
                .padding()
            
            TextField("Name: ", text:$searchByName)
                .padding()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

            Button("Search"){
                
                if !searchByName.isEmpty {
                    let productResult = products.filter{ $0.productName.contains(searchByName)}
                    
                    products = productResult
                }
                else{
                    products = getProducts()
                }
          
                
            }
            
            Button("Order by Name"){
                
                if isSortedbyName {
                    products.sort{ $0.productName < $1.productName }
                    isSortedbyName = false
                }
                else{
                    products.sort{ $1.productName < $0.productName }
                    isSortedbyName = true
                    
                }
            }
            .padding()
            
            Button("Order by Unit Price"){
                
                if isSortedbyPrice{
                    products.sort{ $0.price < $1.price}
                    isSortedbyPrice = false
                }
                else{
                    products.sort{ $1.price < $0.price}
                    isSortedbyPrice = true
                }
                
            }
            .padding()
            
            
            Button("Get Products"){
                
                let minPriceValue : Int = Int(minPrice) ?? 0
                let maxPriceValue : Int = Int(maxPrice) ?? 0
                
                var productResult = [Product]()
                
                
                if minPrice.isEmpty && maxPrice.isEmpty {
                    productResult = getProducts()
                }
                else{
                    if minPrice.isEmpty{
                        productResult =  products.filter{ $0.price < maxPriceValue}
                    }
                    else if maxPrice.isEmpty{
                        productResult =  products.filter{ $0.price > minPriceValue}
                    }
                    else {
                        productResult =  products.filter{ $0.price > minPriceValue && $0.price < maxPriceValue}
                    }
                }
                
                products = productResult
                searchDataCount = productResult.count
                
                
            }
            .padding()
            Text("Count: \(searchDataCount)")
            
            
            if searchDataCount == 0 {
                Text("no result...")
            }
            
            List(products, id:\.id){product in
                Text(product.productName + "  /  " + String(product.price))
            }
        }

        
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}

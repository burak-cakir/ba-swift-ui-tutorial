//
//  AddProductView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 10.10.2021.
//

import SwiftUI

func getProductsData() -> [Product]{
    return [
        Product(productName: "IPhone", unitInStock: 10, description: "apple ın telefon ürün...", price: 10000),
        Product(productName: "Samsung", unitInStock: 22, description: "Koreli arkadaşların telefonu..", price:7000),
        Product(productName: "Huawei", unitInStock: 21, description: "Çinli arkadaşların telefonu..", price: 2500),
        Product(productName: "Lenovo", unitInStock: 5, description: "lenovo pc. thinkpadlerinin wifi sinde sorun var", price: 4400),
        Product(productName: "Mac M1", unitInStock: 11, description: "mac m1 işlemci 10  numara ama pahalı", price: 20000),
        Product(productName: "Siemens", unitInStock: 15, description: "Siemens buzdolabı da yapar..", price: 6400)
    ]
}


struct AddProductView: View {
    
    @State var products : [Product] = getProductsData()
    
    @State var productName = ""
    @State var unitsInStock = ""
    @State var description = ""
    @State var unitPrice = ""
    
    
    func addProduct(product:Product) -> [Product]{
        var productsData = getProductsData()
        productsData.append(product)
        
        
        return productsData
    }
    
    var body: some View {
        VStack{
            
            TextField("Name: ",text:$productName)
                .padding()
            
            TextField("Units In Stock: ",text:$unitsInStock)
                .padding()
            
            TextField("Description: ",text:$description)
                .padding()
            
            TextField("Price: ",text:$unitPrice)
                .padding()
            
            Button("Add"){
                let productPrice : Int = Int(unitPrice) ?? 0
                let productUnitsInStock : Int = Int(unitsInStock) ?? 0
                let newProduct = Product(productName: productName, unitInStock: productUnitsInStock, description: description, price: productPrice)
                
//              products.insert(newProduct, at: 0)
                
                products =  addProduct(product: newProduct)
                
                productName = ""
                unitsInStock = ""
                description = ""
                unitPrice = ""
                
            }
            .padding()
            
            Button("Remove All"){
                products = []
            }
            .padding()
            
            List(products, id:\.id){product in
                Text(product.productName + "  /  " + String(product.price))
            }
            
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}

//
//  AddProductForm.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import SwiftUI

struct AddProductForm: View {
    
   @State var name : String = ""
   @State var discontinued : Bool = false
   @State var quantityPerUnit : String = ""
   @State var unitsInStock: Int = 5
   @State var selection : Int = 1
    
    var productRepository = ProductRepository()
    
    
    var body: some View {
        
        NavigationView{
            Form{
                
                Section(header: Text("Ürün Genel Özellikleri")){
                    
                    TextField("Name", text:$name)
                    TextField("Quantitiy Per Unit", text:$quantityPerUnit)
                    
                    Toggle(isOn: $discontinued){
                        Text("Discontinued")
                    }
                    
                    Stepper(value: $unitsInStock, in: 1...20){
                        Text("Units In Stock: \(unitsInStock)")
                    }
                }
                
                Section(header: Text("Diğer")){
                    Picker(selection: $selection, label:Text("Categories\(selection)")){
                        Text("Category-1").tag(1)
                        Text("Category-2").tag(2)
                        Text("Category-3").tag(3)
                    }
                    
                    Button("Ekle"){
                        
                        let model = ProductModel(name: name, discontinued: discontinued, quantityPerUnit: quantityPerUnit, unitsInStock: unitsInStock, categoryId: 1)
                        
                        productRepository.add(productModel: model){newProduct in
                            print(newProduct)
                        }
                        
                    }
                    .disabled(name.isEmpty || quantityPerUnit.isEmpty)
                }
  
            }
        }
        
 
    }
}

struct AddProductForm_Previews: PreviewProvider {
    static var previews: some View {
        AddProductForm()
    }
}

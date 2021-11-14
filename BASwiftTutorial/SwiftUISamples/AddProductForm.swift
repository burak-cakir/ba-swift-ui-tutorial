//
//  AddProductForm.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import SwiftUI

struct AddProductForm: View {
    
    @State var birthDate = Date()
    
   @State var name : String = ""
   @State var discontinued : Bool = false
   @State var quantityPerUnit : String = ""
   @State var unitsInStock: Int = 5
   @State var categoryId : Int = 1
    @State var supplierId : Int = 1
    
   @State var categories = [CategoryModel]()
   @State var suppliers = [SupplierModel]()
    
    
    var productRepository = ProductRepository()
    var categoryRepository = CategoryRepository()
    var supplierRepository = SupplierRepository()
    
    
    var body: some View {
        
        NavigationView{
            Form{
                
                DatePicker("Doğum tarihi", selection: $birthDate)
                  
                
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
                    Picker(selection: $categoryId, label:Text("Seçilen Kategori Id: \(categoryId)")){
                        if(categories.count > 0){
                                
                            ForEach(categories, id:\.id){item in
                                Text(item.name).tag(item.id)
                            }
                        }
                    }
                    .onAppear(){
                        categoryRepository.getAll(){categoryList in
                            categories = categoryList
                        }
                    }
                    
                    
                    
                    Picker(selection: $supplierId, label:Text("Seçilen tedarikçi Id: \(supplierId)")){
                        if(suppliers.count > 0){
                                
                            ForEach(suppliers, id:\.id){item in
                                Text(item.companyName).tag(item.id)
                            }
                        }
                    }
                    .onAppear(){
                        supplierRepository.getAll(){supplierList in
                            suppliers = supplierList
                        }
                    }
                    
                    
                    
                    
                    Button("Ekle"){
                        
                        let model = ProductModel(name: name, discontinued: discontinued, quantityPerUnit: quantityPerUnit, unitsInStock: unitsInStock,categoryId: categoryId, supplierId: supplierId
                            )
                        
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

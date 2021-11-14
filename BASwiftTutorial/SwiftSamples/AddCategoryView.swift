//
//  AddCategoryView.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import SwiftUI

struct AddCategoryView: View {
    
    @State var name : String = ""
    @State var description : String = ""
    @State var categories : [CategoryModel] = [CategoryModel]()
    
    var categoryRepository = CategoryRepository()
    
    var body: some View {
        VStack{
            
            TextField("Category Name",text:$name)
                .padding()
            TextField("Description",text:$description)
                .padding()
            
            Button("Add"){
                let categoryModel = CategoryModel(name: name, description: description)
                 
                 categoryRepository.add(categoryModel: categoryModel){ newCategory in
                     categories.append(newCategory)
                 }
            }
            
            List(categories, id:\.name){ item in
                Text(item.name)
            }
            .onAppear(){
                categoryRepository.getAll(){categoryList in
                    categories = categoryList
                }
            }
            
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}

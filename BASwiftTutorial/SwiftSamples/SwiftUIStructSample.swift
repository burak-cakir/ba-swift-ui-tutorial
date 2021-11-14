

import SwiftUI

struct SwiftUIStructSample: View {
    
  
    @State var phones : [Product] = [
        Product(productName: "IPhone", unitInStock: 10, description: "apple ın telefon ürün..."),
        Product(productName: "Samsung", unitInStock: 22, description: "Koreli arkadaşların telefonu.."),
        Product(productName: "Huawei", unitInStock: 21, description: "Çinli arkadaşların telefonu..")
    ]
    
    @State var pc : [Product] = [
            
        Product(productName: "Lenovo", unitInStock: 5, description: "lenovo pc. thinkpadlerinin wifi sinde sorun var"),
        Product(productName: "Mac M1", unitInStock: 11, description: "mac m1 işlemci 10  numara ama pahalı"),
    ]
    
    
    
    var body: some View {
        
        List{
            Section(header:Text("Phones")){
                ForEach(phones, id:\.id){ product in
                    Text(product.productName + " * \(product.unitInStock)")
                }
            }
            
            Section(header:Text("PC")){
                ForEach(pc, id:\.id){ product in
                    Text(product.productName + " / \(product.unitInStock)")
                }
            }
        }
        
    }
}

struct SwiftUIStructSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStructSample()
    }
}





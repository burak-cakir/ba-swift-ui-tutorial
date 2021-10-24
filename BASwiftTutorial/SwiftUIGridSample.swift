

import SwiftUI

struct SwiftUIGridSample: View {
    let data = Array(1...500).map{"items \($0)"}
    
    let layout  = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: layout, spacing:10){
                ForEach(data, id:\.self){item in
                    Text(item)
                }
            }
            .padding()
            
        }
    }
}

struct SwiftUIGridSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGridSample()
    }
}

//
//  SwiftUIFetchOperation.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 31.10.2021.
//

import SwiftUI
import Foundation

struct SwiftUIFetchOperation: View {
    
    @ObservedObject var fetch = FetchToDo()
    
    
    
    var body: some View {
       
        NavigationView{
            
            List(fetch.getData()){ todo in

                NavigationLink(
                
                    destination: ToDoPage(id: todo.id),
                    label: {
                        Text(todo.title)
                    }
                )
                .navigationTitle("ToDo List")
                .navigationBarTitleDisplayMode(.inline)
            
            }
        }
    }


struct ToDoPage : View{

    var id:Int

    var body: some View{
        Text(String(id))
    }

}

struct SwiftUIFetchOperation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFetchOperation()
    }
}



class FetchToDo: ObservableObject{
    
    @Published var todos = [ToDo]()
    @Published var todo = ToDo(id: 0, title: "", completed: false)
    
    
    func getData() -> [ToDo] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)

                    //DispatchQueue.main.async {
                        self.todos = decodedData
                    //}
                    
                }
                else{
                    print("No data!")
                }
                
//                guard let todoData = data else{
//                    print("No data!")
//                    return
//                }
//
//                                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)
//
//                                    DispatchQueue.main.async {
//                                        self.todos = decodedData
//                                    }
            }
            catch{
                print("Error!")
            }
        }.resume()
        
        return self.todos
    }
    
    
    func getDataById(id: Int) -> ToDo{
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/" + String(id))!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode(ToDo.self, from: todoData)

                    self.todo = decodedData

                }
                else{
                    print("No data!")
                }
                
            }
            catch{
                print("Error!")
            }
        }.resume()
        
        return self.todo
    }
    
    
    init() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)

                    //DispatchQueue.main.async {
                        self.todos = decodedData
                    //}
                    
                }
                else{
                    print("No data!")
                }
                
//                guard let todoData = data else{
//                    print("No data!")
//                    return
//                }
//
//                                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)
//
//                                    DispatchQueue.main.async {
//                                        self.todos = decodedData
//                                    }
            }
            catch{
                print("Error!")
            }
        }.resume()
    
    }
    
    
    
    
}

struct ToDo: Codable, Identifiable {
    
    public var id: Int
    public var title: String
    public var completed: Bool
    
}

}

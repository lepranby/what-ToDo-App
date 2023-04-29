//  ContentView.swift
//  what
//
//  Created by Aleksej Shapran on 29.04.23

import SwiftUI

struct TodoItem: Identifiable {
    
    let id = UUID()
    let task: String
}

struct whatBody: View {
    
    @State var items = [TodoItem]()
    @State var newTask = ""
    
    var body: some View {
        
        VStack {
            
            Text("w H a t ?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 5)
                .foregroundColor(.black)
            
            Text("Simple To-Do App")
                .font(.callout)
                .fontWeight(.light)
                .foregroundColor(.teal)
            
            HStack {
                
                TextField("Type new task here ...", text: $newTask)
                
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(22)
                    .accentColor(.black)
                
                Button(action: addTask) {
                    
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(.teal)
                }
                
            }
                .padding()
            
            VStack {
                
                List(items) { item in
                    
                    HStack {
                        Text(item.task)
                            .foregroundColor(.teal)
                        Spacer()
                        Button(action: { removeTask(item) }) {
                            Image(systemName: "trash")
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
        }
        .background(.teal.opacity(0.3))
    }


    func addTask() {
        
        if !newTask.isEmpty {
            
            items.append(TodoItem(task: newTask))
            newTask = ""
            
        }
    }

    func removeTask(_ item: TodoItem) {
        
        items.removeAll { $0.id == item.id }
        
    }
}

struct ContentView: View {
    
    var body: some View {
        
        whatBody ()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView ()
        
    }
}

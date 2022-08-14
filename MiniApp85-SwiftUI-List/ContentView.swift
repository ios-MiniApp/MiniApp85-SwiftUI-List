//
//  ContentView.swift
//  MiniApp85-SwiftUI-List
//

import SwiftUI

struct TaskData: Identifiable {
    var title: String
    var completed: Bool
    var id = UUID()
}

struct ContentView: View {
    @State var taskData = [
        TaskData(title: "タスク1", completed: false),
        TaskData(title: "タスク2", completed: false),
        TaskData(title: "タスク3", completed: false),
        TaskData(title: "タスク4", completed: false),
        TaskData(title: "タスク5", completed: false)
    ]

    var body: some View {
        NavigationView {
            VStack {
                List(0..<taskData.count, id:\.self) { index in
                    Button(action: {
                        print("セルが押されたよ")
                        taskData[index].completed.toggle()
                    }) {
                        HStack {
                            Image(systemName: taskData[index].completed ? "checkmark.circle.fill" : "circle")
                            Text(taskData[index].title)
                        }
                    }
                    .foregroundColor(.black)
                }

                HStack{
                    Button("ー"){
                        if !taskData.isEmpty {
                            taskData.removeLast()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()

                    Spacer()

                    Button("＋"){
                        taskData.append(contentsOf: [TaskData(title: "タスク\(taskData.count+1)", completed: false)])
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .navigationTitle("ToDoリスト")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

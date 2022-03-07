//
//  ContentView.swift
//  tasked
//
//  Created by Tiffany Lin on 2/3/22.
//

import SwiftUI
import Combine
//import DailyQuote

struct ContentView: View {
    @EnvironmentObject var taskStore : TaskStore
    @State private var showModal = false
    let quote = CPP_Wrapper().hello_cpp_wrapped()
    func addNewToDo() {
        showModal = true
    }
    
    var header : some View {
        VStack {
            HStack {
            Text("Tasks")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
            Spacer()
            }
            HStack {
            Text("Morning! Here are your current tasks")
                    .font(.title)
                    .padding(.top, 10)
            Spacer()
            }
            HStack (spacing: 50){
                VStack (alignment: .leading){
                    Button(action: self.addNewToDo, label: {
                        Text("+ Add New")
                    })
                        .buttonStyle(ChipButtonStyle(buttonType: "primary"))
                    Text(quote!)
                        .font(.subheadline.italic())
                        .padding(.vertical, 20)
                        .foregroundColor(Color.yellowOutline)
                }
                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                Image("check")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                header.padding(.horizontal, 30)
                if (taskStore.total == 0) {
                    VStack {
                        Image(systemName: "note")
                            .foregroundColor(Color.grey)
                            .font(.system(size: 100))
                        Text("There are no tasks to be done!")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(Color.grey)
                            .padding()
                    }
                    .frame(width: 350, height: 400)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.grey, lineWidth:1)
                    )
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(taskStore.tasks) {task in
                                TaskCard(task: task,
                                        isExpired: Date.now > task.dueDate)
                            }
                        }
                    }
                }
            }
            ModalView(isShowing: $showModal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskStore())
            .previewDevice("iPhone 13")
    }
}

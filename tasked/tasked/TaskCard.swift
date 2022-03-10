//
//  TaskCard.swift
//  tasked
//
//  Created by Tiffany Lin on 4/3/22.
//

import Foundation
import SwiftUI
import Combine

struct TaskCard: View {
    @EnvironmentObject var taskStore: TaskStore
    @State private var showModal = false

    let task: Task
    let isExpired: Bool
    
    func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: date)
    }
    
    func deleteTask() {
        self.showModal = true
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(task.title)
                        .font(.title)
                        .foregroundColor(Color.wordColor)
                        .padding(.bottom, 5)
                    Spacer()
                    Button {
                        deleteTask()
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 20))
                            .foregroundColor(Color.locationRed.opacity(0.5))
                    }
                }
                Text(task.description)
                    .font(.title3)
                    .foregroundColor(Color.wordColor)
                Text(task.createDate.formatted(
                    date: .long, time: .shortened))
                    .font(.body)
                    .foregroundColor(Color.lightWordColor)
                    .padding(.top, 1)
                VStack(alignment: .leading) {
                    Chip(color: Color.locationRed, content: String(task.location), icon: "map")
                    Chip(color: Color.orange, content: convertDate(date: task.dueDate), icon: "clock")
                }
            }
            .padding(30)
            .background(isExpired ? Color.lightRed : Color.lightOrange)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding()
            DeleteView(isShowing: $showModal, task: task)
        }
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard(task: Task.example2, isExpired: true)
                .environmentObject(TaskStore())
    }
}



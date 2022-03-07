//
//  TaskStore.swift
//  tasked
//
//  Created by Tiffany Lin on 6/3/22.
//

import SwiftUI

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
    var total: Int {
        return tasks.count
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        tasks = tasks.sorted(by: {$0.dueDate.compare($1.dueDate) == .orderedAscending})
    }
    
    func removeTask(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)
        }
    }
}

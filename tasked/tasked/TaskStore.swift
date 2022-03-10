//
//  TaskStore.swift
//  tasked
//
//  Created by Tiffany Lin on 6/3/22.
//

import SwiftUI
//
//@propertyWrapper struct @UserDefault<T: Codable> {
//    var key: String
//    var wrappedValue: T? {
//        get {
//            if let data = UserDefaults.standard.object(forKey: key) as? Data {
//                return try? JSONDecoder().decode(T.self, from: data)
//            }
//            return nil
//        }
//        set {
//            if let encoded = try? JSONEncoder().encode(newValue) {
//                UserDefaults.standard.set(encoded, forKey: key)
//            }
//        }
//    }
//}

class TaskStore: ObservableObject {
//    @UserDefault(key: "tasks") var tasks: [Task]?
//    enum CodingKeys: CodingKey {
//        case tasks
//    }
    
    @Published var tasks = [Task]() {
        willSet {
            if let encoded = try? JSONEncoder().encode(tasks) {
                let defaults = UserDefaults.standard
                 defaults.set(encoded, forKey: "tasks")
            }
            objectWillChange.send()
        }
    }

    init() {
        if let savedTasks = UserDefaults.standard.object(forKey: "tasks") as? Data {
            if let loadedTasks = try? JSONDecoder().decode([Task].self, from: savedTasks) {
                self.tasks = loadedTasks
            }
        } else {
            self.tasks = []
        }
    }
//        set {
//            if let encoded = try? JSONEncoder().encode(newValue) {
//                let defaults = UserDefaults.standard
//                 defaults.set(encoded, forKey: "tasks")
//            }
//            objectWillChange.send()
//        }
//    }
    
    var total: Int {
        return tasks.count
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(tasks, forKey: .tasks)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        tasks = try container.decode([Task].self, forKey: .tasks)
//    }

//    init() {}
    
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

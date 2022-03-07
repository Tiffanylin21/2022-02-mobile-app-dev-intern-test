//
//  Task.swift
//  tasked
//
//  Created by Tiffany Lin on 2/3/22.
//
import Foundation
import SwiftUI
import Combine

struct Task: Identifiable, Equatable {
    var id = Int()
    var title = String()
    var description = String()
    var createDate = Date.now
    var dueDate = Date()
    var location = Double()
    let formatter = DateFormatter()
    static let example = Task(id: 1,
                              title: "Do groceries",
                              description: "get milk. eggs and bread",
                              dueDate: Date(),
                              location: 12.3908032
    )
    static let example2 = Task(id: 1,
                              title: "Do groceries",
                              description: "get milk. eggs and bread",
                               dueDate: Date().addingTimeInterval(-86400),
                              location: 12.3908032
    )

}

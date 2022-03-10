//
//  Task.swift
//  tasked
//
//  Created by Tiffany Lin on 2/3/22.
//
import Foundation
import SwiftUI
import Combine

struct Task: Identifiable, Equatable, Codable {
    var id = Int()
    var title = String()
    var description = String()
    var createDate = Date.now
    var dueDate = Date()
    var location = String()
    static let example = Task(id: 1,
                              title: "Do groceries",
                              description: "get milk. eggs and bread",
                              dueDate: Date(),
                              location: "12.39088989032, -112.2312321"
    )
    static let example2 = Task(id: 1,
                              title: "Do groceries",
                              description: "get milk. eggs and bread",
                               dueDate: Date().addingTimeInterval(-86400),
                              location: "12.3908988032, -112.2312321"
    )

}

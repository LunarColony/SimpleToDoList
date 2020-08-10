//
//  AppModel.swift
//  SimpleToDoList
//
//  Created by Yunis Farah on 06/08/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

class Model: ObservableObject {
    struct Task: Identifiable, Codable {
        static var uniqueID = 0

        var id = 0
        var taskName = ""
        var taskCategory = ""
        var priority = 0

        init() {
            Task.uniqueID += 1
            self.id = Task.uniqueID
        }
    }

    @Published var arrayOfTask = [Task]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(arrayOfTask) {
                UserDefaults.standard.set(encoded, forKey: "tasks")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "tasks") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Task].self, from: items) {
                self.arrayOfTask = decoded
                return
            }
        }
        self.arrayOfTask = []
    }
}

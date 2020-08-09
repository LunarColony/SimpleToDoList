//
//  AppModel.swift
//  SimpleToDoList
//
//  Created by Yunis Farah on 06/08/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

enum Catergory {
    case work
    case home
    case family
    case health
    case bills
}

enum Priority {
    case low
    case medium
    case high
    case critical
}



class Model: ObservableObject {
    struct Task {
        var taskName = ""
        var taskCategory = ""
        var priority = 0
    }

    @Published var arrayOfTask = [Task]()
}

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



class Model: ObservableObject {
    @Published var taskName = ""
    @Published var taskCategory = ""
}

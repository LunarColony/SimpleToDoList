//
//  PriorityColors.swift
//  SimpleToDoList
//
//  Created by Yunis Farah on 09/08/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI


struct PriorityGreen: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.green)
    }
}

struct PriorityYellow: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.yellow)
    }
}

struct PriorityOrange: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.orange)
    }
}

struct PriorityRed: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.red)
    }
}


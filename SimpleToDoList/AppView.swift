//
//  AppView.swift
//  SimpleToDoList
//
//  Created by Yunis Farah on 04/08/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var task1 = Model()

    @State var showNewTaskView = false
    var body: some View {
        NavigationView {
            Section {
                List {
                    Text("\(self.task1.taskName)")
                }
            }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .navigationBarTitle("Tasks")
                .navigationBarItems(trailing: Button(action: {
                        self.showNewTaskView.toggle()
                }) {
                        Text("New Task")
                    }
                ).sheet(isPresented: $showNewTaskView) {
                    NewTaskInfoView(newTask: self.task1.taskName, showNewTaskView: self.$showNewTaskView)
            }
        }
    }
}

struct NewTaskInfoView: View {
    @ObservedObject var dataModel = Model()

    @State var newTask: String
    @Binding var showNewTaskView: Bool
    var body: some View {
        NavigationView {
            Section {
                TextField("Task", text: $newTask)
                    .padding()
            }
                .navigationBarTitle("Add new Task")
                .navigationBarItems(trailing: Button(action: {
                        self.dataModel.taskName = self.newTask
                        self.showNewTaskView.toggle()
                        print(self.newTask)
                }) {
                        Text("Save")
                    }
                )
        }
    }
}




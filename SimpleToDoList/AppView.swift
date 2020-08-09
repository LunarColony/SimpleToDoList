//
//  AppView.swift
//  Tasks
//
//  Created by Yunis Farah on 04/08/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var data = Model()
    var task = Model.Task()
    let data2 = Model()
    @State var showViewTwo = false
    func tester() {

    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(data.arrayOfTask, id: \.taskName) { task in
                        HStack {
                            if task.priority == 0 {
                                PriorityGreen()
                            } else if task.priority == 1 {
                                PriorityYellow()
                            } else if task.priority == 2 {
                                PriorityOrange()
                            } else if task.priority == 3 {
                                PriorityRed()
                            }
                            Text("\(task.taskName)")
                        }
                    }
                        .onDelete(perform: removeItems).animation(.default)
                }
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
            }
                .navigationBarTitle("Tasks")
                .navigationBarItems(leading:
                        EditButton().animation(.default),
                    trailing: Button(action: {
                        self.showViewTwo.toggle()
                    }) {
                        Text("New task")
                    }.sheet(isPresented: $showViewTwo) {
                        ViewTwo(data: self.data, showViewTwo: self.$showViewTwo)
                    })
        }
    }



    func removeItems(at offset: IndexSet) {
        data.arrayOfTask.remove(atOffsets: offset)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct ViewTwo: View {
    @State var data: Model
    @State var newName = ""
    @State var newCatergory = ""
    @State var newPriorityLevel = ""

    @State var defaultPriorityLevel = 1
    @State var priorityTypes = ["low", "medium", "high", "critical"]


    @Binding var showViewTwo: Bool
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add task name")) {

                    TextField("Name", text: $newName)
                    /*
                        This section will be implementated later on
                        TextField("Catergory", text: $newCatergory)
                        */
                }
                Section(header: Text("Select task priority")) {
                    Picker("Priority Levels", selection: $defaultPriorityLevel) {
                        ForEach(0..<priorityTypes.count) {
                            Text(self.priorityTypes[$0])
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }
            }
                .navigationBarTitle("New task details")
                .navigationBarItems(trailing:
                        Button("Save") {
                            var task = Model.Task()
                            self.showViewTwo.toggle()
                            task.taskName = self.newName
                            task.priority = self.defaultPriorityLevel
                            self.data.arrayOfTask.append(task)
                    })
        }
    }
}

struct PriorityCirleView: View {
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.green)
    }
}



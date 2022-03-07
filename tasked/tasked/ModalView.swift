//
//  AddModal.swift
//  tasked
//
//  Created by Tiffany Lin on 6/3/22.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var isShowing: Bool
    @State var title : String = ""
    @State var description : String = ""
    @State private var dueDate = Date.now
    @State var location : Double?
    
    let wordColor: Color = Color(.sRGB, red: 243/255, green: 161/255, blue: 36/255)
    let boxColor: Color = Color(.sRGB, red: 243/255, green: 161/255, blue: 36/255)
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func reset() {
        self.title = ""
        self.description = ""
        self.dueDate = Date.now
        self.location = nil
    }

    func closeModal() {
        reset()
        self.isShowing = false
    }
    
    func addNew() {
        let newTask: Task = Task(id: taskStore.total + 1,
                          title: title,
                          description: description,
                          dueDate: dueDate,
                          location: location!)
        taskStore.addTask(task: newTask)
        reset()
        self.isShowing = false
    }
    
    func isValid() -> Bool {
        return !(title.isEmpty || description.isEmpty || location == nil)
    }
    
    var body: some View {
        ZStack {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Text("Create Task")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(wordColor)
                    VStack (alignment: .leading){
                        Text("Title")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .lineLimit(0)
                        TextField("name", text: self.$title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Description: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        TextField("describe task...", text: self.$description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Location: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        TextField("12.233...", value: self.$location, formatter: formatter)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Due by: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        DatePicker("", selection: $dueDate, in: Date.now..., displayedComponents: [.date, .hourAndMinute])
                            .accentColor(wordColor)
                            .labelsHidden()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .datePickerStyle(DefaultDatePickerStyle())
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                    HStack (spacing: 40) {
                        Button(action: closeModal, label: {
                            Text("Cancel")
                        })
                            .buttonStyle(ChipButtonStyle(buttonType: "secondary"))
                        Button(action: addNew, label: {
                            Text("   Add   ")
                        })
                            .buttonStyle(ChipButtonStyle(buttonType: "primary"))
                            .disabled(!isValid())
                            .clipShape(Capsule())
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 30)
                .frame(height: 450)
                .frame(maxWidth: .infinity)
                .foregroundColor(wordColor)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isShowing: .constant(true))
            .environmentObject(TaskStore())
    }
}

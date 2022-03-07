//
//  DeleteView.swift
//  tasked
//
//  Created by Tiffany Lin on 7/3/22.
//

import SwiftUI

struct DeleteView: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var isShowing: Bool
    @State var task: Task?
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    

    func closeModal() {
        self.isShowing = false
    }
    
    func deleteTask() {
        taskStore.removeTask(task: task!)
        task = nil
        closeModal()
    }
    
    var body: some View {
        ZStack {
            if isShowing {
                Color.white
                    .opacity(0.8)
                    .ignoresSafeArea()
                VStack (spacing: 40) {
                    Text("Are you sure you want to delete '" + task!.title + "' ?")
                        .font(.system(size: 23))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.yellowWordColor)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 40) {
                        Button(action: closeModal, label: {
                            Text("   Cancel   ")
                        })
                            .buttonStyle(ChipButtonStyle(buttonType: "secondary"))
                        Button(action: deleteTask, label: {
                            Text("   Delete   ")
                        })
                            .buttonStyle(ChipButtonStyle(buttonType: "primary"))
                            .clipShape(Capsule())
                    }
                }
                .padding()
                .frame(width: 300)
                .frame(height: 200)
                .foregroundColor(Color.yellowWordColor)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
        }
        .ignoresSafeArea()
        .animation(.easeInOut)
    }

}

struct DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteView(isShowing: .constant(true), task: Task.example)
            .environmentObject(TaskStore())

    }
}

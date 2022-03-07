//
//  Chip.swift
//  tasked
//
//  Created by Tiffany Lin on 4/3/22.
//

import SwiftUI

struct Chip: View {
    let color: Color
    let content: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon + ".fill")
            Text(content)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .foregroundColor(Color.white)
        .background(color)
        .clipShape(Capsule())
        .shadow(radius: 2)
        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(color: Color.locationRed, content: "21 Mar 2020 12:30pm", icon: "map")
    }
}

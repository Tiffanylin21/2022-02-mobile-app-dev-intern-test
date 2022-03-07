//
//  ChipButtonStyle.swift
//  tasked
//
//  Created by Tiffany Lin on 7/3/22.
//

import SwiftUI

struct ChipButtonStyle: ButtonStyle {
  let buttonType: String
    func makeBody(configuration: Self.Configuration) -> some View {
      ChipButtonStyleView(configuration: configuration, buttonType: buttonType)
  }
}

private extension ChipButtonStyle {
  struct ChipButtonStyleView: View {
    @Environment(\.isEnabled) var isEnabled
    let configuration: ChipButtonStyle.Configuration
    let buttonType: String

    var body: some View {
      return configuration.label
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .foregroundColor((self.buttonType == "primary" || !isEnabled) ? Color.white : .yellowOutline)
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(!isEnabled ? Color.grey : (self.buttonType == "primary") ? Color.yellowFill : Color.paleWhite)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(isEnabled ? Color.yellowOutline : Color.grey, lineWidth: 1))
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
  }
}

struct ChipButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("primary") {
                print("click!")
            }
            .disabled(false)
                .buttonStyle(ChipButtonStyle(buttonType: "primary"))
            Button("secondary") {
                print("click!")
            }
            .disabled(false)
                .buttonStyle(ChipButtonStyle(buttonType: "secondary"))
            Button("disabled") {
                print("click!")
            }
            .disabled(true)
                .buttonStyle(ChipButtonStyle(buttonType: "secondary"))
        }
    }
}

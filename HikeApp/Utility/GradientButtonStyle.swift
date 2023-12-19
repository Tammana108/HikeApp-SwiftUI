//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by Tammana Sharma on 17/12/23.
//

import Foundation
import SwiftUI

struct GradientButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ? LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom) :
                    LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .bottom, endPoint: .top)
            )
            .cornerRadius(40)
    }
    
}

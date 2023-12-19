//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Tammana Sharma on 17/12/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient : Bool = false
    var body: some View {
        Circle()
            .fill(LinearGradient(colors:
                [
                .colorIndigoMedium,
                .colorSalmonLight],
                                 startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                 endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing))
            .frame(width: 256, height: 256)
            .onAppear() {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                    isAnimateGradient.toggle()
                }
            }
    }

}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}

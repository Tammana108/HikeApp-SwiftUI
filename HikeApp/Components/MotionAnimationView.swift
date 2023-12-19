//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Tammana Sharma on 17/12/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: Properties
    
    //MARK: Random Circle
    @State private var randomCircle : Int = Int.random(in: 6 ... 12)
    @State private var isAnimating : Bool = false
    
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in : 0 ... 256)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4 ... 80))
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ... randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width : randomSize())
                    .position(x : randomCoordinate(),
                              y : randomCoordinate())
                    .onAppear(perform : {
                        <#code#>
                    })
            }
        }
        .frame(width: 256, height: 256)
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            MotionAnimationView()
        }
       
    }
}

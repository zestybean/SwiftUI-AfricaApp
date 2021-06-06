//
//  MotionAnimationView.swift
//  Africa (iOS)
//
//  Created by Brando Lugo on 6/6/21.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //MARK: - FUNCTIONS
    
    //1. Random coord
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    //3. Random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. Random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //5. Random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//:LOOP
            }//:ZSTACK
            .drawingGroup()
        }//:GEOMETRY
    }
}

//MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

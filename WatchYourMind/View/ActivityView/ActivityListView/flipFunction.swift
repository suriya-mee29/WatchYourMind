//
//  flip.swift
//  WatchYourMind
//
//  Created by Gatang on 9/3/2564 BE.
//

import SwiftUI

struct flipFunction: GeometryEffect {
    
    
    @Binding var flipped: Bool
    let axis: (x:CGFloat, y: CGFloat)
    var angle: Double
    var animatableData: Double{
        get{
            angle
        }
        set{
            angle = newValue
        }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        let tweakAngle = flipped ? -180 + angle : angle
        let a = CGFloat(Angle(degrees: tweakAngle).radians)
        
        var tranform3d = CATransform3DIdentity
        tranform3d.m34 = -1/max(size.width, size.height)
        
        tranform3d = CATransform3DRotate(tranform3d, a, axis.x, axis.y, 0)
        tranform3d = CATransform3DTranslate(tranform3d, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0))
        
        return ProjectionTransform(tranform3d).concatenating(affineTransform)
    }
}



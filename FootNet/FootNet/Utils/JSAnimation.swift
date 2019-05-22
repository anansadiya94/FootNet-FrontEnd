//
//  JSAnimation.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

public struct JSAnimation {
    public let duration: TimeInterval
    public let closure: (UIView) -> Void
}

public extension JSAnimation {
    static func fadeIn(duration: TimeInterval = 0.3) -> JSAnimation {
        return JSAnimation(duration: duration, closure: { $0.alpha = 1 })
    }
    
    static func fadeOut(duration: TimeInterval = 0.3) -> JSAnimation {
        return JSAnimation(duration: duration, closure: { $0.alpha = 0 })
    }
    
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> JSAnimation {
        return JSAnimation(duration: duration, closure: { $0.bounds.size = size })
    }
    
    static func move(byX x: CGFloat, y: CGFloat, duration: TimeInterval = 0.3) -> JSAnimation {
        return JSAnimation(duration: duration) {
            $0.center.x += x
            $0.center.y += y
        }
    }
}

public extension UIView {
    func animate(_ animations: [JSAnimation]) {
        // Exit condition: once all animations have been performed, we can return
        guard !animations.isEmpty else {
            return
        }
        
        // Remove the first animation from the queue
        var animations = animations
        let animation = animations.removeFirst()
        
        // Perform the animation by calling its closure
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            // Recursively call the method, to perform each animation in sequence
            self.animate(animations)
        })
    }
    
    func animate(inParallel animations: [JSAnimation]) {
        for animation in animations {
            UIView.animate(withDuration: animation.duration) {
                animation.closure(self)
            }
        }
    }
}

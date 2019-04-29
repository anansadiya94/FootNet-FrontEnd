//
//  LottieAnimation.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class LottieAnimation {
    var lottieAnimationView = AnimationView()
    
    func startLottieAnimation(){
        lottieAnimationView.isHidden = false
        lottieAnimationView.play()
    }

    func stopLottieAnimation(){
        lottieAnimationView.isHidden = true
        lottieAnimationView.stop()
    }

    func createLottieAnimation(view: UIView) {
        lottieAnimationView.isHidden = true
        lottieAnimationView.animation = Animation.named("ball")
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.contentMode = .scaleAspectFit
        //lottieAnimationView.backgroundColor = UIColor.colorSecondary
        view.addSubview(lottieAnimationView)
        let horizontalConstraint = lottieAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = lottieAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = lottieAnimationView.widthAnchor.constraint(equalToConstant: 200)
        let heightConstraint = lottieAnimationView.heightAnchor.constraint(equalToConstant: 200)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}

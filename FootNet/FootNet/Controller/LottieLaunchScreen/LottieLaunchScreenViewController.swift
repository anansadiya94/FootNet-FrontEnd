//
//  LottieLaunchScreenViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import Lottie

class LottieLaunchScreenViewController: UIViewController {

    @IBOutlet weak var lottieAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView()
    }
    
    private func animationView() {
        lottieAnimationView.animation = Animation.named("soccer")
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.contentMode = .scaleAspectFit
        
        lottieAnimationView.isHidden = false
        lottieAnimationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.lottieAnimationView.stop()
            self.lottieAnimationView.isHidden = true
        }
    }
}

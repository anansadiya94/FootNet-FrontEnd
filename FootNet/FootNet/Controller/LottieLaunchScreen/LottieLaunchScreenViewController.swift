//
//  LottieLaunchScreenViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import Lottie

class LottieLaunchScreenViewController: BaseViewController {

    @IBOutlet weak var lottieAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        animationView()
    }
    
    private func animationView() {
        lottieAnimationView.animation = Animation.named("soccer")
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.backgroundColor = UIColor.colorPrimary
        lottieAnimationView.isHidden = false
        lottieAnimationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.lottieAnimationView.stop()
            self?.lottieAnimationView.isHidden = true
            let signInStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
            let signInViewController = signInStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
            self?.present(signInViewController, animated: true, completion: nil)
        }
    }
}

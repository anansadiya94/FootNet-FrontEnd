//
//  ForgotPasswordViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        //Navigation bar buttons
        createLeftButton()
        
        // navigationController Configuration
        navigationController?.navigationBar.topItem?.title = "forgotPassword_navBarTitle".localize()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    //Back button navigationbar
    private func createLeftButton() {
        self.navigationItem.hidesBackButton = true
        let imageName = "backButton"
        let image = UIImage(named: imageName)
        let newLeftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(ForgotPasswordViewController.back(sender:)))
        newLeftBarButtonItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = newLeftBarButtonItem
    }
    
    @objc func back(sender: UIBarButtonItem) {
        _ = self.dismiss(animated: true, completion: nil)
    }
}

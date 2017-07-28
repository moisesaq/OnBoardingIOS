//
//  HomeController.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/27/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class HomeController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Dragon ball Z"
        addBarButton()
        let imageView = UIImageView(image: UIImage(named: "main_image"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    fileprivate func addBarButton(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
    }
    
    func handleSignOut(){
        UserDefaults.standard.setIsLoggedIn(value: false)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}

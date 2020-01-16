//
//  MainNavigationController.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/27/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if isLoggedIn(){
            let homerController = HomeController()
            viewControllers = [homerController]
        }else{
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool{
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            //Perhaps we'll do something here later
        });
    }
}

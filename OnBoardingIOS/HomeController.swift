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
        //view.backgroundColor = .yellow
        let imageView = UIImageView(image: UIImage(named: "main_image"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

//
//  LoginCell.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/26/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = self.generateTextFieldBase(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = self.generateTextFieldBase(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handlerLogin), for: .touchUpInside)
        return button
    }()
    
    //Weak breaks the retain cycle
    weak var delegate: LoginControllerDelegate?
    
    @objc func handlerLogin(){
        delegate?.finishedLoggingIn()
    }
    
    func generateTextFieldBase(placeholder: String) -> LeftPaddedTextField {
        let textField = LeftPaddedTextField()
        textField.placeholder = placeholder
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }
    
    func setUpView(){
        addViews()
        alignViews()
    }
    
    fileprivate func addViews(){
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    func alignViews(){
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        print(" Land scape login cell \(UIDevice.current.orientation.isLandscape)")
        if UIDevice.current.orientation.isLandscape {
            _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: centerXAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 50)
            
            _ = passwordTextField.anchor(logoImageView.bottomAnchor, left: centerXAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 5, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        }else{
            _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
            
            _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
            
        }
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
}

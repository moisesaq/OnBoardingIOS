//
//  LeftPaddedTextField.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/26/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class LeftPaddedTextField: UITextField{
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}

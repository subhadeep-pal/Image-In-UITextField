//
//  ImageTextField.swift
//  ImageTextField
//
//  Created by Subhadeep Pal on 26/05/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

@IBDesignable
class ImageTextField: UITextField {
    
    @IBInspectable var leftImage : UIImage? {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var padding : CGFloat = 0 {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var placeholderColour : UIColor = UIColor.white {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSForegroundColorAttributeName : placeholderColour])
            updateLeftView()
        }
    }
    
    @IBInspectable var rightImage : UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    
    func updateRightView() {
        if let image = rightImage {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20 , height: 20))
            imageView.image = image
            
            let width = 20 + padding
            
            imageView.tintColor = placeholderColour
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            rightViewMode = .always
            rightView = view
        } else {
            rightView = nil
            rightViewMode = .never
        }

    }
    
    func updateLeftView() {
        
        if let image = leftImage {
            
            let imageView = UIImageView(frame: CGRect(x: padding, y: 0, width: 20 , height: 20))
            imageView.image = image
            
            var width = 20 + padding
            
            if borderStyle == .none || borderStyle == .line {
                width += 5
            }
            
            imageView.tintColor = placeholderColour
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftViewMode = .always
            leftView = view
            
        } else {
            leftView = nil
            leftViewMode = .never
        }
        
    }

}

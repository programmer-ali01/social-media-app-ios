//
//  Utilities.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 12/14/20.
//  Copyright © 2020 Alisena Mudaber. All rights reserved.
//

import UIKit

class Utilities {
    func inputContainer(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageView.image = image
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
        imageView.setDimensions(width: 20, height: 20)
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65).isActive = true
        
        let dividerLine = UIView()
        dividerLine.backgroundColor = .white
        view.addSubview(dividerLine)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        dividerLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        dividerLine.setDimensions(width: 0, height: 0.75)
        
        return view
        
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
    

}

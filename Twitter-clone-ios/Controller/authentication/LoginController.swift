//
//  LoginController.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 10/21/20.
//  Copyright © 2020 Alisena Mudaber. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    private let logoImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        // image literal
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helper functions
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        logoImageView.setDimensions(width: 150, height: 150)
        
    }
}

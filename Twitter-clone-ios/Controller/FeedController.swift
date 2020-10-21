//
//  FeedController.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 10/20/20.
//  Copyright © 2020 Alisena Mudaber. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    // MARK: - Helper functions
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}

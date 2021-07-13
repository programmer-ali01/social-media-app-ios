//
//  MainTabController.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 10/20/20.
//  Copyright © 2020 Alisena Mudaber. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    var user: User? {
        didSet {
            // sends user to feed controller
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedViewController else { return }
            
            feed.user = user
        }
    }
    
    
    // MARK: - Variables & Properties
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .khaki_web
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.setDimensions(width: 32, height: 32)
        button.addTarget(self, action: #selector(handleActionButton), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        authenticateUserAndConfigureUI()
        // logUserOut()
    }
    
    
    // MARK: - API
    
    
    // MARK: - Selector Functions
    
    @objc func handleActionButton() {
        print("DEBUG: actionButton pressed")
    }
    
    // MARK: - Helper Functions
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            renderViewControllers()
            configureMainUI()
            fetchUser()
        }
    }
    
    func fetchUser() {
        UserService.shared.fetchUser { user in
            self.user = user
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: logout successful")
        } catch let error {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func configureMainUI() {
        configureActionButton()
    }
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        actionButton.setDimensions(width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }
    
    func renderViewControllers() {
        let feed = FeedViewController()
        let feedIcon = UIImage(systemName: "house.fill")
        let nav1 = navigationTemplateController(image: feedIcon!, viewController: feed)
        
        let notifications = NotificationsViewController()
        let notificationIcon = UIImage(systemName: "exclamationmark.bubble.fill")
        let nav2 = navigationTemplateController(image: notificationIcon, viewController: notifications)
        
        viewControllers = [nav1, nav2]
    }
    
    func navigationTemplateController(image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }
}

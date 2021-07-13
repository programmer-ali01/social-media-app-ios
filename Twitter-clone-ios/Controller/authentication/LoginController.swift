//
//  LoginController.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 10/21/20.
//  Copyright © 2020 Alisena Mudaber. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties and Variables
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        let iv = UIImage(systemName: "text.bubble.fill")
        image.image = iv
        return image
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(systemName: "envelope")
        let view = Utilities().inputContainer(withImage: image!, textField: emailTextField)
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(systemName: "lock")
        let view = Utilities().inputContainer(withImage: image!, textField: passwordTextField)
    
        
        return view
     }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField  = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.khaki_web, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Dont have an account?", " Sign up")
        button.addTarget(self, action: #selector(handleSignupTransition), for: .touchUpInside)
        return button
    }()
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "annie-spratt-L6GydBHMVGQ-unsplash-2")!)
        configureMainUI()
    }
    
    // MARK: - Selectors
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.logUserIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error logging in \(error.localizedDescription)")
                return
            }
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            
            guard let tab = window.rootViewController as? MainTabBarController else { return }
            tab.authenticateUserAndConfigureUI()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleSignupTransition() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helper Functions
    
    func configureMainUI() {
        configureLogoImage()
        configureInputContainers()
        configureDontHaveAccountButton()
    }
    
    func configureLogoImage() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        logoImage.setDimensions(width: 100, height: 100)
    }
    
    func configureInputContainers() {
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: logoImage.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 32).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 30).isActive = true
    }
    
    func configureDontHaveAccountButton() {
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}



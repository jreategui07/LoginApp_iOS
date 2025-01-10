//
//  ViewController.swift
//  LoginApp
//
//  Created by Jonathan Reátegui on 2025-01-10.
//

import UIKit

class ViewController: UIViewController {
    
    private let wallpaperImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "wallpaper")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let halfSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBackground
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let rememberMeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let rememberMeSwitch: UISwitch = {
        let rememberSwitch = UISwitch()
        rememberSwitch.translatesAutoresizingMaskIntoConstraints = false
        return rememberSwitch
    }()
    
    private let rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Help?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Wallpaper
        self.view.insertSubview(wallpaperImageView, at: 0)
        
        // Logo
        self.view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        // Half-sheet
        self.view.addSubview(halfSheetView)
        
        NSLayoutConstraint.activate([
            halfSheetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            halfSheetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            halfSheetView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            halfSheetView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
        
        // Form items
        halfSheetView.addSubview(usernameTextField)
        halfSheetView.addSubview(passwordTextField)
        rememberMeStackView.addArrangedSubview(rememberMeSwitch)
        rememberMeStackView.addArrangedSubview(rememberMeLabel)
        horizontalStackView.addArrangedSubview(rememberMeStackView)
        horizontalStackView.addArrangedSubview(helpButton)
        halfSheetView.addSubview(horizontalStackView)
        halfSheetView.addSubview(continueButton)

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: halfSheetView.topAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            horizontalStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            horizontalStackView.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            
            continueButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 20),
            continueButton.centerXAnchor.constraint(equalTo: halfSheetView.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 300),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

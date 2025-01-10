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
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
        return textField
    }()

    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
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
        label.textColor = UIColor(red: 0.14, green: 0.17, blue: 0.41, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Help?", for: .normal)
        button.setTitleColor(UIColor(red: 0.14, green: 0.17, blue: 0.41, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor(red: 0.84, green: 0.85, blue: 0.91, alpha: 1.00)
        button.setTitleColor(UIColor(red: 0.47, green: 0.47, blue: 0.59, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let button1Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button 1", for: .normal)
        button.setTitleColor(UIColor(red: 0.14, green: 0.17, blue: 0.41, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button2Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button 2", for: .normal)
        button.setTitleColor(UIColor(red: 0.14, green: 0.17, blue: 0.41, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        rememberMeStackView.addArrangedSubview(rememberMeSwitch)
        rememberMeStackView.addArrangedSubview(rememberMeLabel)
        horizontalStackView.addArrangedSubview(rememberMeStackView)
        horizontalStackView.addArrangedSubview(helpButton)
        
        bottomStackView.addArrangedSubview(button1Button)
        bottomStackView.addArrangedSubview(separatorView)
        bottomStackView.addArrangedSubview(button2Button)
        
        halfSheetView.addSubview(usernameTextField)
        halfSheetView.addSubview(passwordTextField)
        halfSheetView.addSubview(horizontalStackView)
        halfSheetView.addSubview(continueButton)
        halfSheetView.addSubview(bottomStackView)

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: halfSheetView.topAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            horizontalStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            horizontalStackView.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -20),
            
            continueButton.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 20),
            continueButton.centerXAnchor.constraint(equalTo: halfSheetView.centerXAnchor),
            continueButton.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 25),
            continueButton.heightAnchor.constraint(equalToConstant: 55),
            
            helpButton.widthAnchor.constraint(equalToConstant: 100),
            helpButton.heightAnchor.constraint(equalToConstant: 55),
            button1Button.widthAnchor.constraint(equalToConstant: 100),
            button1Button.heightAnchor.constraint(equalToConstant: 55),
            button2Button.widthAnchor.constraint(equalToConstant: 100),
            button2Button.heightAnchor.constraint(equalToConstant: 55),
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.heightAnchor.constraint(equalToConstant: 30),
            
            bottomStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 20),
            bottomStackView.leadingAnchor.constraint(equalTo: halfSheetView.leadingAnchor, constant: 50),
            bottomStackView.trailingAnchor.constraint(equalTo: halfSheetView.trailingAnchor, constant: -50),
        ])
    }
}

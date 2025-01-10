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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.insertSubview(wallpaperImageView, at: 0)
        self.view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        self.view.addSubview(halfSheetView)

        NSLayoutConstraint.activate([
            halfSheetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            halfSheetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            halfSheetView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            halfSheetView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
    }
}

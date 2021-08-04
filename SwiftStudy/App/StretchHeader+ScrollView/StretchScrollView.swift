//
//  StretchScrollView.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/08/04.
//

import UIKit

class StretchScrollView: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var label: UILabel!
    var headerContainerView: UIView!
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        setViewConstraints()
        
        scrollView.backgroundColor = UIColor.black
        
        // Label Customization
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.text = "YOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HEREYOUR TEXT HERE"
        
        // Set Image on the Header
        imageView.image = UIImage(named: "swiftimgae")
        
    }
    
    func createViews() {
        // ScrollView
        scrollView = UIScrollView()
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        // Label
        label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        self.scrollView.addSubview(label)
        
        // Header Container
        headerContainerView = UIView()
        headerContainerView.backgroundColor = .gray
        self.scrollView.addSubview(headerContainerView)
        
        // ImageView for background
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        self.headerContainerView.addSubview(imageView)
        
    }
    
    func setViewConstraints() {
        // ScrollView Constraints
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // Label Constraints
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.label.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
            self.label.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 280)
        ])
        
        // Header Container Constraints
        let headerContainerViewBottom : NSLayoutConstraint!
        
        self.headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerContainerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        headerContainerViewBottom = self.headerContainerView.bottomAnchor.constraint(equalTo: self.label.topAnchor, constant: -10)
        headerContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerContainerViewBottom.isActive = true
        
        
        // ImageView Constraints
        let imageViewTopConstraint: NSLayoutConstraint!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor)
        ])
        
        imageViewTopConstraint = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
        
    }
}

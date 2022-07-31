//
//  SplashViewController.swift
//  StoreApp
//
//  Created by Angel on 30/07/2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.fadeIn()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        let guide = self.view.safeAreaLayoutGuide
        view.backgroundColor = .systemGray3
        view.addSubview(logo)
        NSLayoutConstraint.activate([
            logo.heightAnchor.constraint(equalToConstant: 250),
            logo.widthAnchor.constraint(equalToConstant: 250),
            logo.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            logo.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        ])
        self.showAnimation(animation: "Loader")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideAnimation()
            self.navigationController?.pushViewController(MainViewController(), animated: true)
            self.navigationController?.navigationBar.isHidden = false
        }
    }
}

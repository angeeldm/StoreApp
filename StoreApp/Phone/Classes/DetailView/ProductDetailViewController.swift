//
//  ProductDetailViewController.swift
//  StoreApp
//
//  Created by Angel on 30/07/2022.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {
    
    private lazy var detailTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    private lazy var detailDescription: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.heightAnchor.constraint(equalToConstant: 200).isActive = true
        description.isUserInteractionEnabled = false
        description.backgroundColor = .systemGray4
        return description
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "emptyFile")
        return image
    }()
    
    private var productTitle: String = ""
    private var productDescription: String = ""
    private var productImage: String = ""
    
    static func instantiate(title: String, description: String, image: String) -> ProductDetailViewController {
        let vc = ProductDetailViewController()
        vc.productTitle = title
        vc.productDescription = description
        vc.productImage = image
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureInterface()
    }
    
    private func setupView() {
        let guide = self.view.safeAreaLayoutGuide
        self.view.addSubview(image)
        self.view.addSubview(detailTitle)
        self.view.addSubview(detailDescription)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: guide.topAnchor, constant: 24),
            image.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            detailTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12),
            detailTitle.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            detailTitle.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            detailDescription.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: 12),
            detailDescription.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            detailDescription.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureInterface() {
        self.title = "Detalle"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = .systemGray4
        detailTitle.text = productTitle
        detailDescription.text = productDescription
        if let urlImage = URL(string: productImage) {
            image.kf.setImage(with: urlImage)
        }
    }
}

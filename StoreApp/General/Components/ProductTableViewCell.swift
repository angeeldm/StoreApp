//
//  ProductTableViewCell.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productTitle: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier: String { "ProductTableViewCell" }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configureCell(product: Product) {
        productTitle.text = product.title
        productDescription.text = product.description
        if let urlImage = URL(string: product.image) {
            productImage.kf.setImage(with: urlImage)
        }
    }
}

extension ProductTableViewCell {
    class func buildCell(_ tableView: UITableView, indexPath: IndexPath, objProduct: Product) -> ProductTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? ProductTableViewCell
        cell?.configureCell(product: objProduct)
        return cell ?? ProductTableViewCell()
    }
}

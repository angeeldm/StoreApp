//
//  Product.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import Foundation

struct Product {
    let title:          String
    let description:    String
    let image:          String
    
    init(_ dto: ProductDTO) {
        self.title          = dto.title ?? ""
        self.description    = dto.description ?? ""
        self.image          = dto.image ?? ""
    }
}

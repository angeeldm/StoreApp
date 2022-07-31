//
//  ProductDTO.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import Foundation

struct ProductResponseDTO: Decodable {
    let response: [ProductDTO]?
}

struct ProductDTO: Decodable {
    let title:          String?
    let description:    String?
    let image:          String?
}

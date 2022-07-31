//
//  Clousures.swift
//  StoreApp
//
//  Created by Angel on 28/07/2022.
//

import UIKit

typealias ErrorHandler = (_ errorMessage: String) -> Void
typealias AlertAction = (_ : UIAlertAction) -> Void
typealias ProductsResponseHandler = (_ : [ProductDTO]) -> Void
typealias ProductsArray = (_ productsArray: [Product]) -> Void

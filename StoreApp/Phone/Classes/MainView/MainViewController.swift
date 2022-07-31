//
//  MainViewController.swift
//  StoreApp
//
//  Created by Angel on 28/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var productsTable: UITableView!
    
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        navigationController?.navigationBar.backgroundColor = .systemGray4
        navigationItem.setHidesBackButton(true, animated: true)
        self.title = "StoreApp"
        viewModel.toGetProducts()
    }
    
    private func setupTableView() {
        productsTable.backgroundColor = .systemGray4
        productsTable.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
        productsTable.delegate = self
        productsTable.dataSource = self
    }
    
    private func setupBinding() {
        viewModel.bindInitRequest = {
            self.showAnimation(animation: "Loader")
        }
        
        viewModel.bindEndRequest = {
            self.hideAnimation()
        }
        
        viewModel.bindErrorHandler = { (message) in
            self.setupAlert(title: "Ocurrió un error", message: message)
        }
        
        viewModel.bindRefreshData = { (response) in
            DispatchQueue.main.async {
                self.productsTable.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productsResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ProductTableViewCell.buildCell(tableView, indexPath: indexPath, objProduct: viewModel.productsResult[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let itemSelected = viewModel.productsResult[indexPath.row]
        let title = itemSelected.title
        let description = itemSelected.description
        let image = itemSelected.image
        
        self.navigationController?.pushViewController(ProductDetailViewController.instantiate(title: title, description: description, image: image), animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

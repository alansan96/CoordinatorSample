//
//  ProductListController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class ProductListController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    
    weak var coordinator: ProductListCoordinator?
    let productList: [String]
    
    init(productList: [String]) {
        self.productList = productList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "product list"
        labelText.text = productList.joined(separator: "\n")
    }
    
    @IBAction func showCartTapped(_ sender: UIButton) {
        coordinator?.showCart()
    }
    
    @IBAction func showDetail(_ sender: Any) {
        coordinator?.showDetail()
    }
}

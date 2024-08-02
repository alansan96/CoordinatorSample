//
//  ProductDetailController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class ProductDetailController: UIViewController {
    
    weak var coordinator: ProductListCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "product detail"
        // Do any additional setup after loading the view.
    }


    @IBAction func showCart(_ sender: UIButton) {
        coordinator?.showCart()
    }
}

//
//  CategoriesController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class CategoriesController: UIViewController {
    
    weak var coordinator: CategoriesCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        // Do any additional setup after loading the view.
    }

    @IBAction func showProductList1Tapped(_ sender: UIButton) {
        coordinator?.showProductList(productList: ["apel", "jeruk", "semangka", "melon"])
    }
    
    
    @IBAction func showProductList2Tapped(_ sender: Any) {
        coordinator?.showProductList(productList: ["ayam", "sapi", "kambing", "bebek"])
    }
    
    @IBAction func showCartTapped(_ sender: UIButton) {
        coordinator?.showCart()
    }
    
    
}

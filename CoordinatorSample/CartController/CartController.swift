//
//  CartController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class CartController: UIViewController {
    
    weak var coordinator: CartCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToCategories(_ sender: UIButton) {
        coordinator?.backToCategories()
    }
    
    @IBAction func backTohome(_ sender: UIButton) {
        coordinator?.backtoHome()
    }

}

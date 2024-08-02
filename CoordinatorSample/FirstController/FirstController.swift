//
//  FirstController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class FirstController: UIViewController {
    
    @IBOutlet weak var detailButton: UIButton!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailButton.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)
        
    }
    
    @objc func showDetailTapped() {
        coordinator?.showProfile()
    }
    
    @IBAction func showCategoriesTapped(_ sender: UIButton) {
        coordinator?.showCategories()
    }
    
}

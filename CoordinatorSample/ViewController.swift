//
//  ViewController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?


    @IBOutlet weak var detailBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        
        detailBtn.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)

    }

    @objc func showDetailTapped() {
//            coordinator?.showDetail()
        }


}


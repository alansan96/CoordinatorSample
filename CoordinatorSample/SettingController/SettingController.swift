//
//  SettingController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class SettingController: UIViewController {
    
    weak var coordinator: ProfileCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Setting"
    }

    @IBAction func homeButtonTapped(_ sender: UIButton) {
        coordinator?.popToRoot()
    }
}

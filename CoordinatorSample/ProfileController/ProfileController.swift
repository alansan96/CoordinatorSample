//
//  ProfileController.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var settingButton: UIButton!
    
    
    weak var coordinator: ProfileCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
    }
    
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        coordinator?.showSettings()
    }
}

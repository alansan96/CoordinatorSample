//
//  Coordinator.swift
//  CoordinatorSample
//
//  Created by Alan on 01/08/24.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject{
    var navigationController: UINavigationController? {get set}
    var parentCoordinator: Coordinator? { get set }
    func start()
}

class BaseCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    func start() {
        // To be overridden by child coordinators
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}


class MainCoordinator: BaseCoordinator {
    
    override func start() {
        let firstController = FirstController()
        firstController.coordinator = self
        navigationController?.pushViewController(firstController, animated: false)
    }
    
    func showProfile() {
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.navigationController = navigationController
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
    }
    
    func showCategories(){
        let categoriesCoordinator = CategoriesCoordinator()
        categoriesCoordinator.navigationController = navigationController
        addChildCoordinator(categoriesCoordinator)
        categoriesCoordinator.start()
    }
}


class ProfileCoordinator: BaseCoordinator {
    
    override func start() {
        let profileViewController = ProfileController()
        profileViewController.coordinator = self
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func showSettings() {
        let settingsViewController = SettingController()
        settingsViewController.coordinator = self
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
        if let parent = parentCoordinator as? BaseCoordinator {
            parent.removeChildCoordinator(self)
        }
    }
}


class CategoriesCoordinator: BaseCoordinator, CartCoordinatorDelegate{
   
    
    override func start() {
        let categoriesController = CategoriesController()
        categoriesController.coordinator = self
        navigationController?.pushViewController(categoriesController, animated: true)
    }
    
    func showProductList(productList: [String]){
        let productListCoordinator = ProductListCoordinator(productList: productList)
        productListCoordinator.navigationController = navigationController
        addChildCoordinator(productListCoordinator)
        productListCoordinator.start()
    }
    
    func showCart(){
        let cartCoordinator = CartCoordinator()
        cartCoordinator.navigationController = navigationController
        cartCoordinator.delegate = self
        addChildCoordinator(cartCoordinator)
        cartCoordinator.start()
    }
    
    //CartCoordinatorDelegate
    
    func cartCoordinatorBackToCategories(_ coordinator: CartCoordinator) {
        if let categoriesViewController = navigationController?.viewControllers.first(where: { $0 is CategoriesController }) {
            navigationController?.popToViewController(categoriesViewController, animated: true)
        }
        removeChildCoordinator(coordinator)
    }
    
    func cartCoordinatorBackToHome(_ coordinator: CartCoordinator) {
        navigationController?.popToRootViewController(animated: true)
        removeChildCoordinator(coordinator)
    }
}

class ProductListCoordinator: BaseCoordinator, CartCoordinatorDelegate{
    let productList: [String]
    
    init(productList: [String]) {
        self.productList = productList
    }
    
    override func start() {
        let productListController = ProductListController(productList: productList)
        productListController.coordinator = self
        navigationController?.pushViewController(productListController, animated: true)
    }
    
    func showCart(){
        let cartCoordinator = CartCoordinator()
        cartCoordinator.navigationController = navigationController
        cartCoordinator.delegate = self
        addChildCoordinator(cartCoordinator)
        cartCoordinator.start()
    }
    
    func showDetail(){
        let productDetailController = ProductDetailController()
        productDetailController.coordinator = self
        navigationController?.pushViewController(productDetailController, animated: true)

    }
    
    func cartCoordinatorBackToCategories(_ coordinator: CartCoordinator) {
        if let categoriesViewController = navigationController?.viewControllers.first(where: { $0 is CategoriesController }) {
            navigationController?.popToViewController(categoriesViewController, animated: true)
        }
        removeChildCoordinator(coordinator)
    }
    
    func cartCoordinatorBackToHome(_ coordinator: CartCoordinator) {
        navigationController?.popToRootViewController(animated: true)
        removeChildCoordinator(coordinator)
    }
}

protocol CartCoordinatorDelegate: AnyObject {
    func cartCoordinatorBackToCategories(_ coordinator: CartCoordinator)
    func cartCoordinatorBackToHome(_ coordinator: CartCoordinator)
}

class CartCoordinator: BaseCoordinator{
    
    weak var delegate: CartCoordinatorDelegate?
    
    override func start() {
        let cartController = CartController()
        cartController.coordinator = self
        navigationController?.pushViewController(cartController, animated: true)
        
    }
    
    func backToCategories(){
        delegate?.cartCoordinatorBackToCategories(self)
    }
    
    func backtoHome(){
        delegate?.cartCoordinatorBackToHome(self)
    }
}

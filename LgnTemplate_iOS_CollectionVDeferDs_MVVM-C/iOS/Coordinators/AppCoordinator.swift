//
//  AppCoordinator.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {

    var isAuth = false
    var navigationController: UINavigationController?
    var flowCompletionHangler: CoordinatorHandler?
    var childCoordinators: [CoordinatorProtocol] = []
    
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let navigation = self.navigationController else { return }
        if navigation.viewControllers.count > 0 {
            navigation.viewControllers.removeAll()
        }
        if isAuth {
            self.showItemListFlow()
        } else {
            self.showRegistrationFlow()
        }
    }
    
    private func showItemListFlow() {
        guard let navigation = self.navigationController else { return }
        let listCoordinator = CoordinatorsFactory().createItemListCoordinator(navigationController: navigation)
        childCoordinators.append(listCoordinator)
        listCoordinator.flowCompletionHangler = { [weak self] in
        }
        listCoordinator.start()
    }
    
    
    private func showRegistrationFlow() {
        guard let navigation = self.navigationController else { return }
        let registrationCoordinator = CoordinatorsFactory().createRegistrationCoordinator(navigationController: navigation)
        childCoordinators.append(registrationCoordinator)
        registrationCoordinator.flowCompletionHangler = { [weak self] in
            self?.isAuth = true
            self?.start()
        }
        registrationCoordinator.start()
    }
}

//
//  CoordinatorsFactory.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit

class CoordinatorsFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController)
    }
    
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        return RegistrationCoordinator(navigationController: navigationController)
    }
    
    func createItemListCoordinator(navigationController: UINavigationController) -> ItemListCoordinator {
        return ItemListCoordinator(navigationController: navigationController)
    }
    
}

//
//  ItemListCoordinator.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit

class ItemListCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    var flowCompletionHangler: CoordinatorHandler?
    
    private var itemsModuleFactory = ItemsModuleFactory()
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        showItemListViewConteller()
    }
    
    private func  showItemListViewConteller() {
        let controller = itemsModuleFactory.createItemListViewConrtoller()
        controller.completionHandler = { [weak self] in
            self?.flowCompletionHangler?()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}


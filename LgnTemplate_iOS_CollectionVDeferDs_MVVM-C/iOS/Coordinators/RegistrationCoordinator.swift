//
//  RegistrationCoordinator.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit

class RegistrationCoordinator: CoordinatorProtocol {
    let id = "RegistrationCoordinator_CoordinatorProtocol"
    var navigationController: UINavigationController?
    var flowCompletionHangler: CoordinatorHandler?
    
    private var moduleFactory = RegistrationModuleFactory()
    private var userData = UserData()
    
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        showPhoneNumberViewConteller()
    }
    
    private func  showPhoneNumberViewConteller() {
        let controller = moduleFactory.createPhoneNumberController()
        controller.completionHandler = { [weak self] value in
            self!.userData.phoneNumber = value
            self!.showConfirmConteller()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func  showConfirmConteller() {
        let controller = moduleFactory.createPhoneConfirmViewController()
        controller.completionHandler = { [weak self] value in
            if value {
                self!.showPasswordViewController()
            } else {
                print("error")
            }
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showPasswordViewController() {
        let controller = moduleFactory.createPasswordViewController()
        controller.completionHandler = { [weak self] value in
            self!.userData.password = value
            self!.showBirthdayViewConteller()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func  showBirthdayViewConteller() {
        let controller = moduleFactory.createBirthdayViewController()
        controller.completionHandler = { [weak self] value in
            self!.userData.birthDay = value
//            self!.showItemListViewConteoller()
            self?.flowCompletionHangler?()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}

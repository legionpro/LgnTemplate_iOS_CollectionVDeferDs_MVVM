//
//  ModuleFactory.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import UIKit

class RegistrationModuleFactory {
    func createPhoneNumberController() -> PhoneNumberViewController {
        return PhoneNumberViewController()
    }
    
    func createPhoneConfirmViewController() -> PhoneConfirmViewController {
        return PhoneConfirmViewController()
    }
    
    func createPasswordViewController() -> PasswordViewController {
        return PasswordViewController()
    }
    
    func createNameViewController() -> NameViewController {
        return NameViewController()
    }
    
    func createBirthdayViewController() -> BirthdayViewController {
        return BirthdayViewController()
    }
}

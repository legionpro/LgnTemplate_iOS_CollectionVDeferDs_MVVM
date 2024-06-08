//
//  CoordinatorProtocol.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import Foundation
import UIKit

typealias CoordinatorHandler = () -> ()

protocol CoordinatorProtocol: AnyObject {
    
    var navigationController: UINavigationController? { get set }
    var flowCompletionHangler: CoordinatorHandler? { get set }
    
    func start()
}


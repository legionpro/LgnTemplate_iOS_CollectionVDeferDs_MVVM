//
//  FlowControllerProtocol.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import Foundation

protocol FlowControllerProtocol {
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}

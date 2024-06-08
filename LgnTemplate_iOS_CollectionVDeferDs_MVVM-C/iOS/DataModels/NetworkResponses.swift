//
//  NetworkResponses.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

// MARK: - the Types for describing the real data from network Get

import Foundation

//MARK: - Describes Items for using on UI
struct ItemDataModel: Hashable {
    let name: String
    let image: String
}


struct ItemDataModelList {
    let list: [ItemDataModel] = []
}

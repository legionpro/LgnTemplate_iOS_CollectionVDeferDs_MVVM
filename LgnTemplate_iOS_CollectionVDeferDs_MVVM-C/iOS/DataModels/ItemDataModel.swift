//
//  ItemDataModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

import Foundation


//MARK: - Describes Items for using on UI
struct ResponceItemDataModel: Hashable {
    let name: String
    let image: String
}


struct ResponceItemDataModelList {
    let list: [ResponceItemDataModel] = []
}

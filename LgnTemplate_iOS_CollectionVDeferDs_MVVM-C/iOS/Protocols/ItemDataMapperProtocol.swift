//
//  ItemDataMapperProtocol.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

import Foundation

// MARK: - jsut protocol for mapping  response data to items
protocol ItemDataMapperProtocol {

    func itemResponseToItem(_ response: ResponceItemDataModelList ) -> ItemDataModelList
}


// FIXME: - needs real implematation
extension ItemDataMapperProtocol {

    func itemResponseToItem(_ response: ResponceItemDataModelList ) -> ItemDataModelList {
        var result = ItemDataModelList()
        return result
    }
}

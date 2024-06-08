//
//  ItemsModuleFactory.swift
//  iOS
//
//  Created by Oleh Poremskyy on 08.06.2024.
//

import Foundation

class ItemsModuleFactory {
    func createItemListViewConrtoller() -> ItemListViewConrtoller {
        let itemListViewModel = ItemListViewModel(model: ItemListModel())
        return ItemListViewConrtoller(viewModel: itemListViewModel)
    }
}

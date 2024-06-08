//
//  ItemListViewModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 03.06.2024.
//

import Foundation


class ItemListViewModel {
    private var model: ItemListModelProtocol
    
    init(model: ItemListModelProtocol) {
        self.model = model
    }
    
}



extension ItemListViewModel {
    var itemsList: [ItemDataModel] {
        get { self.model.itemsList }
    }
}


//FIXME: -  To provide dummy data fot viewcontroller
extension ItemListViewModel {
    var dummyItemsList: [ItemDataModel] {
        get {
            self.model.createData()
            return self.model.itemsList
        }
    }
}

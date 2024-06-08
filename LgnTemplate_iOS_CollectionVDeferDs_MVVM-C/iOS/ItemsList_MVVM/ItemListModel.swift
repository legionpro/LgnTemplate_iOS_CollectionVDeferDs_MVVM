//
//  ItemListModel.swift
//  iOS
//
//  Created by Oleh Poremskyy on 03.06.2024.
//
import Foundation

//MARK: - Data for main screen  -  Item List Controller
class ItemListModel {
    
    private var items = [ItemDataModel]()
}

extension ItemListModel: ItemListModelProtocol {
    
    var itemsList: [ItemDataModel] {
        get { self.items }
    }
    
    //FIXME:  - Just for dummy data
    func createData() {
        for i in 0..<10 {
            items.append(ItemDataModel(name:"Item name \(i)", image: ""))
        }
    }
}


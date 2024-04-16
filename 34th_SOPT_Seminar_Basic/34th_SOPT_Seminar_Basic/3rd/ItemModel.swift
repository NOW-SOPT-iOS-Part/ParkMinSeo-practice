//
//  ItemModel.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/20/24.
//

import UIKit

struct ItemModel {
    var itemImg: UIImage
    var name: String
    var price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .productItem1, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem2, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem3, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem4, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem5, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem1, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem2, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem3, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem4, name: "ASDF", price: "1234", heartIsSelected: false),
            ItemModel(itemImg: .productItem5, name: "ASDF", price: "1234", heartIsSelected: false)
        ]
    }
}

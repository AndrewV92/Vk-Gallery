//
//  DataModel.swift
//  Vk-Gallery
//
//  Created by Андрей Воробьев on 25.03.2022.
//

import Foundation

struct DataModel: Decodable {
    var response: Response
    
}

struct Response: Decodable {
    var items: [Item]
    var count: Int
}

struct Item: Decodable {
    var date: Int
    var sizes: [Size]
}

struct Size: Decodable {
    var url: String
    var type: String
}

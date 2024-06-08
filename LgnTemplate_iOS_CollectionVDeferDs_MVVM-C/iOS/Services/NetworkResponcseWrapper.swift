//
//  ResPWrap.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

import Foundation

// MARK: - to wrap a dataType for using in network request
struct NetworkResponcseWrapper<T: Decodable>: Decodable {
    let status: Int?
    let message: String?
    let data: T?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(Int.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
}

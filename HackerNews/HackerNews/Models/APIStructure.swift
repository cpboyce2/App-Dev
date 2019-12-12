//
//  APIStructure.swift
//  HackerNews
//
//  Created by Connor Boyce on 11/3/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

struct HackerData: Codable{
    let hits: [Post]
}
struct Post: Codable, Identifiable {

    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

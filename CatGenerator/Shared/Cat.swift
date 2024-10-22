//
//  Cat.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

enum CatQualityLevel {
    case common
    case uncommon
    case rare
    case legendary
    case godlike
}

struct Cat {
    var name: String
    let attributes: Dictionary<String, Int>
    let qualityLevel: CatQualityLevel
    var imageURL: String?
    var isSaved: Bool

    init(name: String,
         attributes: Dictionary<String, Int>,
         qualityLevel: CatQualityLevel,
         imageURL: String? = nil,
         isSaved: Bool) {
        
        self.name = name
        self.attributes = attributes
        self.qualityLevel = qualityLevel
        self.imageURL = imageURL
        self.isSaved = isSaved
    }
}

/*
 [
    {
        "id":"3sd",
        "url":"https://cdn2.thecatapi.com/images/3sd.gif",
        "width":500,
        "height":193
    }
 ]
 */

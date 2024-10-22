//
//  Cat.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

struct Cat {
    var name: String
    // Attributes
    let softness: Int
    let cuteness: Int
    let agility: Int
    let speed: Int
    let stealth: Int
    var imageURL: String?
    var isSaved: Bool

    init(name: String,
         softness: Int,
         cuteness: Int,
         agility: Int,
         speed: Int,
         stealth: Int,
         imageURL: String? = nil,
         isSaved: Bool) {
        
        self.name = name
        self.softness = softness
        self.cuteness = cuteness
        self.agility = agility
        self.speed = speed
        self.stealth = stealth
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

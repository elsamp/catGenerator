//
//  Cat.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

struct Cat {
    
    var name: String
    
    //attributes
    let softness: Int
    let cuteness: Int
    let agility: Int
    let speed: Int
    let stealth: Int
    
    //image data
    let imageData: Data?
    
    init(name: String, softness: Int, cuteness: Int, agility: Int, speed: Int, stealth: Int, imageData: Data? = nil) {
        self.name = name
        self.softness = softness
        self.cuteness = cuteness
        self.agility = agility
        self.speed = speed
        self.stealth = stealth
        self.imageData = imageData
    }
    
}

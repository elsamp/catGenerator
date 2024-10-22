//
//  PreviewHelper.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-22.
//

import Foundation

struct PreviewHelper {
    
    static let shared = PreviewHelper()
    
    init() { }
    
    func mockCat() -> Cat {
        Cat(name: "Fluffypants",
            attributes: ["Softness": 5,
                         "Cuteness": 4,
                         "Agility": 2,
                         "Speed": 2,
                         "Stealth": 3],
            qualityLevel: .rare,
            isSaved: false)
        
    }
}

extension PreviewHelper: SaveCatUseCaseProtocol {
    
    func execute(cat: Cat) { }
}

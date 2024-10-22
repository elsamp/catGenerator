//
//  Generator.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

protocol GeneratorProtocol {

    func generateCat() -> Cat
}

struct Generator: GeneratorProtocol {

    private let maxAttributePoints = 5

    /**
     Generates a Cat entity with randomly set attributes and assigns a name that reflects those attribute values.
     Note that this generator does not populate image data.
     - Returns: A Cat struct with name and attributes populated.
     */
    func generateCat() -> Cat {

        var cat = Cat(name: "Unnamed",
                      softness: Int.random(in: 0...maxAttributePoints),
                      cuteness: Int.random(in: 0...maxAttributePoints),
                      agility: Int.random(in: 0...maxAttributePoints),
                      speed: Int.random(in: 0...maxAttributePoints),
                      stealth: Int.random(in: 0...maxAttributePoints),
                      isSaved: false)

        let name = generateName(for: cat)
        cat.name = name

        return cat
    }

    /**
     Generates an appropriate name for the passed Cat based on assigned attribute levels
     - Parameter cat: The Cat to be named.
     - Returns: The generated Cat name
     */
    private func generateName(for cat: Cat) -> String {

        return "Not Yet Implemented"
    }
}

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
    private let catAttributeTypes = ["Softness", "Cuteness", "Agility", "Speed", "Stealth"]

    /**
     Generates a Cat entity with randomly set attributes and assigns a name that reflects those attribute values.
     Note that this generator does not populate image data.
     - Returns: A Cat struct with name and attributes populated.
     */
    func generateCat() -> Cat {

        var catAttributes = [String: Int]()
        
        for attributeType in catAttributeTypes {
            catAttributes[attributeType] = Int.random(in: 0...maxAttributePoints)
        }
        
        var cat = Cat(name: generateName(for: catAttributes),
                      attributes: catAttributes,
                      qualityLevel: generateQualityLevel(for: catAttributes),
                      isSaved: false)
        return cat
    }

    /**
     Generates an appropriate name for the passed Cat based on assigned attribute levels
     - Parameter attributes: Indicates the total number of attributes as well as the assigned values for each
     - Returns: The generated Cat name
     */
    private func generateName(for attributes: [String: Int]) -> String {
        // TODO: Implement
        return "Not Yet Implemented"
    }
    
    /**
     Determins the cat quality level based on the passed attribute values. Assumes a total posible value of maxAttributePoints
     - Parameter attributes: Indicates the total number of attributes as well as the assigned values for each
     - Returns: The calculated quality level of the cat.
     */
    private func generateQualityLevel(for attributes: [String: Int]) -> CatQualityLevel {
        // TODO: Implement
        return .common
    }
}

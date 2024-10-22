//
//  CatViewModel.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

protocol CatViewModelProtocol: ObservableObject {

    var cat: Cat { get }
    var catImageURL: URL? { get }
    var catAttributeLabels: [String] { get }
    var catAttributeValues: [Int] { get }

    func recieveIntent(_ intent: Intent)
}

class CatViewModel: CatViewModelProtocol {

    @Published var cat: Cat
    private let saveCatUseCase: SaveCatUseCaseProtocol
    
    var catAttributeLabels: [String] {
        cat.attributes.keys.sorted()
    }
    
    var catAttributeValues: [Int] {
        var values = [Int]()
        
        for label in catAttributeLabels {
            if let value = cat.attributes[label] {
                values.append(value)
            }
        }
        
        return values
    }
    
    var catImageURL: URL? {

        if let urlString = cat.imageURL {
            return URL(string: urlString)
        }

        return nil
    }
    
    init(cat: Cat, saveCatUseCase: SaveCatUseCaseProtocol) {
        self.cat = cat
        self.saveCatUseCase = saveCatUseCase
    }

    func recieveIntent(_ intent: Intent) {

        switch intent {
        case .saveCat(let cat):
            saveCatUseCase.execute(cat: cat)
        default:
            break
        }
    }
}

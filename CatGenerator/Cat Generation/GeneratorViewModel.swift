//
//  GeneratorViewModel.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

protocol GeneratorViewModelProtocol: ObservableObject {
    var cat: Cat? { get }
    var isCatSaved: Bool { get }
    
    func recieveIntent(_ intent: Intent)
}

enum Intent {
    case generateCat
    case saveCat(Cat)
}

class GeneratorViewModel: GeneratorViewModelProtocol {
    
    @Published var cat: Cat?
    @Published var isCatSaved = false
    
    private let generateCatUseCase: GenerateCatUseCaseProtocol
    private let saveCatUseCase: SaveCatUseCaseProtocol

    init(generateCatUseCase: GenerateCatUseCaseProtocol, saveCatUseCase: SaveCatUseCaseProtocol) {
        self.generateCatUseCase = generateCatUseCase
        self.saveCatUseCase = saveCatUseCase
    }
    
    func recieveIntent(_ intent: Intent) {
        switch intent {
        case .generateCat:
            cat = generateCatUseCase.execute()
            isCatSaved = false
        case .saveCat(let cat):
            saveCatUseCase.execute(cat: cat)
            isCatSaved = true
        }
    }
    
}

//
//  GeneratorViewModel.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation
import Combine

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
    
    var catImageURL: URL? {
        
        if let cat = cat, let urlString = cat.imageURL {
            return URL(string: urlString)
        }
        
        return nil
    }
    
    private let generateCatUseCase: any GenerateCatUseCaseProtocol
    private let saveCatUseCase: SaveCatUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(generateCatUseCase: any GenerateCatUseCaseProtocol,
         saveCatUseCase: SaveCatUseCaseProtocol) {
        self.generateCatUseCase = generateCatUseCase
        self.saveCatUseCase = saveCatUseCase
        addSubscribers()
    }
    
    func recieveIntent(_ intent: Intent) {
        switch intent {
        case .generateCat:
            cat = nil
            isCatSaved = false
            generateCatUseCase.execute()
        case .saveCat(let cat):
            saveCatUseCase.execute(cat: cat)
            isCatSaved = true
        }
    }
    
    private func addSubscribers() {
        generateCatUseCase.catPublisher
            .sink { [weak self] cat in
                self?.cat = cat
            }
            .store(in: &cancellables)
    }
    
}

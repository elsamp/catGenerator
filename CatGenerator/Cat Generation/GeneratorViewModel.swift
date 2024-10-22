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

    func recieveIntent(_ intent: Intent)
}

// TODO: move out of this file
enum Intent {
    case generateCat
    case saveCat(Cat)
}

class GeneratorViewModel: GeneratorViewModelProtocol {

    @Published var cat: Cat?

    private let generateCatUseCase: any GenerateCatUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(generateCatUseCase: any GenerateCatUseCaseProtocol,
         saveCatUseCase: SaveCatUseCaseProtocol) {
        self.generateCatUseCase = generateCatUseCase
        addSubscribers()
    }

    func recieveIntent(_ intent: Intent) {
        switch intent {
        case .generateCat:
            cat = nil
            generateCatUseCase.execute()
        case .saveCat(let cat):
            break
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

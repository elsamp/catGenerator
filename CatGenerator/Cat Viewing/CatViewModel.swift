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
}

class CatViewModel: CatViewModelProtocol {

    @Published var cat: Cat

    private let saveCatUseCase: SaveCatUseCaseProtocol

    init(cat: Cat, saveCatUseCase: SaveCatUseCaseProtocol) {
        self.cat = cat
        self.saveCatUseCase = saveCatUseCase
    }

    var catImageURL: URL? {

        if let urlString = cat.imageURL {
            return URL(string: urlString)
        }

        return nil
    }
}

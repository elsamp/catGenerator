//
//  SaveCatUseCase.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation


protocol SaveCatUseCaseProtocol {
    
    func execute(cat: Cat)
}

struct SaveCatUseCase: SaveCatUseCaseProtocol {
    
    /**
     Save the passed cat in local persistant storage (expand...)
     */
    func execute(cat: Cat) {
        
        //TODO: persist in local storage
    }
}

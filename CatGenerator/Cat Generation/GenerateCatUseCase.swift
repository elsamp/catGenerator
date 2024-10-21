//
//  GenerateCatUseCase.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

protocol GenerateCatUseCaseProtocol {
    
    func execute() -> Cat
}

struct GenerateCatUseCase: GenerateCatUseCaseProtocol {
    
    private let generator: GeneratorProtocol
    
    /**
     Leverages the Generator object it is initialized with to generate and return back a Cat.
     - Returns: A Cat with all properties set.
     */
    func execute() -> Cat {
        
        var cat = generator.generateCat()
        
        //fetch image data
        
        return cat
    }
}

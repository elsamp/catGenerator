//
//  CatImage.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation

//Expected format returned from https://api.thecatapi.com/v1/images/search

/*
 [
    {
        "id":"3sd",
        "url":"https://cdn2.thecatapi.com/images/3sd.gif",
        "width":500,
        "height":193
    }
 ]
 */

struct CatImage: Identifiable, Codable {
    
    let id: String
    let url: String
    let width: Int
    let height: Int
    
}

//
//  ContentView.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = GeneratorViewModel(generateCatUseCase: GenerateCatUseCase(generator: Generator()),
                                       saveCatUseCase: SaveCatUseCase())
    var body: some View {
        VStack {
            Text("The Cat:")
            
            if let cat = viewModel.cat {
                Text(cat.name)
            }
            
            if let imageURL = viewModel.catImageURL {
                AsyncImage(url: imageURL)
            }
            
            Button("Generate Cat") {
                viewModel.recieveIntent(.generateCat)
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(.capsule)
            
            Image(systemName: viewModel.isCatSaved ? "heart.fill" : "heart")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

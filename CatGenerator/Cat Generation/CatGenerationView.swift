//
//  ContentView.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import SwiftUI

struct CatGenerationView: View {

    @ObservedObject var viewModel = GeneratorViewModel(generateCatUseCase: GenerateCatUseCase(generator: Generator()),
                                       saveCatUseCase: SaveCatUseCase())
    var body: some View {
        VStack {

            if let cat = viewModel.cat {
                CatCardView(viewModel: CatViewModel(cat: cat, saveCatUseCase: SaveCatUseCase()))
            } else {
               placeholderView
            }

            Spacer()

            generateCatButton
        }
        .background(.gray)
    }

    var placeholderView: some View {
        Text("quote goes here")
    }

    var generateCatButton: some View {
        Button("Generate Cat") {
            viewModel.recieveIntent(.generateCat)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(.blue)
        .clipShape(.capsule)
        .padding()
    }

}

#Preview {
    CatGenerationView()
}

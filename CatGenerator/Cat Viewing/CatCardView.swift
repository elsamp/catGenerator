//
//  CatCardView.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-22.
//

import SwiftUI

struct CatCardView: View {

    @ObservedObject var viewModel: CatViewModel

    var body: some View {
       VStack {
           ZStack(alignment: .trailing) {
               Text(viewModel.cat.name)
                   .frame(maxWidth: .infinity)
                   .padding(.horizontal, 30)

               Button {
                   viewModel.recieveIntent(.saveCat(viewModel.cat))
               } label: {
                   Image(systemName: viewModel.cat.isSaved ? "heart.fill" : "heart")
                       .foregroundColor(.red)
               }
               .padding(.horizontal, 12)
           }
           
           Rectangle()
               .containerRelativeFrame(.vertical, count: 5, span: 3, spacing: 0)
               .overlay {
                   // TODO: handle phases
                   AsyncImage(url: viewModel.catImageURL)
                       .scaledToFill()
               }
               .clipped()
           
           VStack(alignment: .leading) {
               catStats(labels: viewModel.catAttributeLabels, values: viewModel.catAttributeValues)
           }
           .frame(maxWidth: .infinity)
           .padding(.horizontal, 30)

       }
    }

    func catStats(labels: [String], values: [Int]) -> some View {

        VStack(spacing: 3) {
            ForEach(0..<labels.count, id: \.self) { index in
                catStatBar(label: labels[index], value: values[index])
                if index + 1 < labels.count {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                }
            }
        }
    }

    func catStatBar(label: String, value: Int) -> some View {
        HStack {
            Text(label)
                .frame(width: 100, alignment: .leading)
                
            
            HStack {
                ForEach(0..<value, id: \.self) { _ in
                    Image(systemName: "star.fill")
                }
            }
            
            Spacer()
        }
    }
}


#Preview {
    CatCardView(viewModel: CatViewModel(cat: PreviewHelper.shared.mockCat(),
                                        saveCatUseCase: PreviewHelper.shared))
}

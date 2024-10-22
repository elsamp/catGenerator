//
//  GenerateCatUseCase.swift
//  CatGenerator
//
//  Created by Erica Sampson on 2024-10-21.
//

import Foundation
import Combine

protocol GenerateCatUseCaseProtocol: ObservableObject {

    var catPublisher: Published<Cat?>.Publisher { get }
    func execute()

}

class GenerateCatUseCase: GenerateCatUseCaseProtocol {

    @Published private var generatedCat: Cat?
    var catPublisher: Published<Cat?>.Publisher { $generatedCat }

    @Published private var catImage: CatImage?

    private let generator: GeneratorProtocol
    private var cancellables = Set<AnyCancellable>()

    init(generator: GeneratorProtocol) {
        self.generator = generator
        addSubscribers()
    }

    /**
     Kicks off cat creation and image data download process and returns immediatly.
     Will generate and publish Cat when data is ready for consumption. 
     Callers can subscribe to catPublisher to recieve published Cats.
     */
    func execute() {
        self.downloadPhotoData()
    }

    private func addSubscribers() {
        self.$catImage
            .sink { [weak self] catImage in
                if var cat = self?.generator.generateCat() {
                    cat.imageURL = catImage?.url
                    self?.generatedCat = cat
                }
            }
            .store(in: &cancellables)
    }

    private func downloadPhotoData() {

        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput(output:))
            .decode(type: [CatImage].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading image data: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedImages in
                if returnedImages.count >= 1 {
                    self?.catImage = returnedImages.first
                }
            }
            .store(in: &cancellables)
    }

    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {

        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }

        return output.data
    }
}

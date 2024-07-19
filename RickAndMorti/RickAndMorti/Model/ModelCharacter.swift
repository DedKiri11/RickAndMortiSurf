//
//  ModelData.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import Foundation
import UIKit


@Observable
class ModelCharacter {
    var characters: [Character] = []
    var currentPage: Int = 1
    
    init() {
        APIHelper.passthrough.sink { data in
            let decoder = JSONDecoder()
            
            guard let decodedData = try? decoder.decode(CharacterResponse.self, from: data) else { return }
            if self.currentPage != 1 {
                self.characters += (decodedData.results)
                return
            }
            self.characters = decodedData.results
            
        }.store(in: &APIHelper.canсellables)
        
        load()
    }
    
    func load() {
        APIHelper.sendRequest(method: .loadCharacter)
    }
    
    func search(with text: String) {
        currentPage = 1
        APIHelper.sendRequest(method: .loadCharacter, params: ["name": text])
    }
    
    func getNewPage() {
        currentPage += 1
        APIHelper.sendRequest(method: .loadCharacter, params: ["page": String(currentPage)])
    }
}


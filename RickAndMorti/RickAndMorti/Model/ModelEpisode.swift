//
//  ModelEpisode.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import Foundation
import UIKit


@Observable
class ModelEpisode {
    var episodes: [Episode] = []
    
    init() {
        APIHelper.passthrough.sink { data in
            let decoder = JSONDecoder()
            
            guard let decodedData = try? decoder.decode(EpisodeResponse.self, from: data) else { return }
            self.episodes = decodedData.results
            
        }.store(in: &APIHelper.canсellables)
        
        APIHelper.sendRequest(method: .loadEpisode)
    }
    
    func getEpisodes (characterEpisodes: [String]) -> String {
        var result: [String] = []
        
        for episode in episodes {
            for characterEpisode in characterEpisodes {
                if episode.url == characterEpisode {
                    result.append(episode.name)
                }
            }
        }
        
        return result.joined(separator: ", ")
    }
}

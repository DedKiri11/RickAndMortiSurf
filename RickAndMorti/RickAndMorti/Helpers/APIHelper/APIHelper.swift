//
//  APIHelper.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import Foundation
import Combine

class APIHelper {
    enum APIErrors: String {
        case badURL
        case badRequest
        case dataMissing
    }
    
    enum APIMethods: String {
        case loadCharacter = "character"
        case loadLocation = "location"
        case loadEpisode = "episode"
    }
    
    private static let baseURL = "https://rickandmortyapi.com/api/"
    static let passthrough = PassthroughSubject<Data,Never>()
    static var canсellables =  Set<AnyCancellable>()
    
    static func sendRequest(method: APIMethods, params: [String: String] = [:]) {
        let requestUrl = baseURL + method.rawValue + getParams(params)
        
        guard let url = URL(string: requestUrl) else {
            print(APIErrors.badURL.rawValue)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(APIErrors.badRequest.rawValue + ": \(error)")
                return
            }
            
            guard let data = data else {
                print(APIErrors.dataMissing.rawValue)
                return
            }
            
            self.passthrough.send(data)
        }
    
        task.resume()
    }
    
    private static func getParams(_ params: [String: String]) -> String {
        guard !params.isEmpty else { return "" }
        
        var result: [String] = []
        
        result = params.map { $0.key + "=" + $0.value }
        
        return "/?" + result.joined(separator: "&")
    }
}

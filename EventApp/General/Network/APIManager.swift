//
//  APIManager.swift
//  EventApp
//
//  Created by betina farias on 05/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

typealias RequestParameters = [String: String]

public enum GenericError: Error {
    case settingCredentials
}

public enum APIError: Error {
    case message(description: String)
    case invalidUrl
    case jsonParsing
    case requestFailure
}

protocol APIErrorDelegate {
    func didGetAPIError(error: Error)
    func shouldShowInternetError()
}

extension APIErrorDelegate {
    func shouldShowInternetError() {}
}

enum RequestMethod: String {
    case POST
    case GET
    case DELETE
    case PUT
}

protocol APIRoute {
    var method: RequestMethod { get }
    var path: String { get }
    var parameters: RequestParameters? { get }
}

final class APIManager {
    static func request<T: Decodable>(with route: APIRoute, completion: @escaping (Result<T, APIError>) -> Void) {
        var urlComponents = URLComponents(string: APIConstants.BaseURL)
        urlComponents?.path = route.path
    
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidUrl))
            return
        }
        
        if let parameters = route.parameters {
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        var request = URLRequest(url: url)
        request.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: APIConstants.HTTPHeaderField.contentType.rawValue)
        request.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: APIConstants.HTTPHeaderField.acceptType.rawValue)
        request.httpMethod = route.method.rawValue
    
        _ = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let _  = error {
                completion(.failure(.requestFailure))
            }
            
            guard let response = response as? HTTPURLResponse, response.succeeded else {
                completion(.failure(.requestFailure))
                return
            }
            
            do {
                guard let data = data else {
                    completion(.failure(.requestFailure))
                    return
                }
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.jsonParsing))
            }
            
        }).resume()
    }
}

extension HTTPURLResponse {
    // TODO: Handle all http erros
    var succeeded: Bool {
        if statusCode >= 200 && statusCode < 300 {
            return true
        }
        return false
    }
}

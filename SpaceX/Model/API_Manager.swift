//
//  API_Manager.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation


enum APIError: String, Error {
    case badUrl = "bad URL"
    case invalidData = "This url has returned invalid data"
    case invalidJosn = "not able to parse JSON"
}

class API_Manager {
    
    func getData(completionHandler: @escaping (Result<[launch], APIError>) -> Void)  {
        
        let baseUrl = "https://api.spacexdata.com/v3/launches"
        guard let url = URL(string: baseUrl) else {
            completionHandler(.failure(.badUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.badUrl))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidData))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let launchData = try decoder.decode([launch].self, from: data)
                completionHandler(.success(launchData))
            } catch {
                completionHandler(.failure(.invalidJosn))
            }
        }
        task.resume()
    }
}

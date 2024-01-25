//
//  Provider.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 12-01-24.
//

import Foundation
import Alamofire

final class Provider {
    
    static let shared = Provider()
    
    private let URL = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2023-01-01&endtime=2023-01-02"
    private let statusOK = 200...299
    
    func fetchDataFromAPI(completion: @escaping (Result<EarthquakeDataResponse, Error>) -> Void) {
        
        AF.request(URL, method: .get)
            .validate()
            .responseDecodable(of: EarthquakeDataResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

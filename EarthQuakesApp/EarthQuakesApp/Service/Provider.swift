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
    let textAPP = TextsInTheApp()
    
    private var initialDate: String?
    private var finalDate: String?
    
    func getURL() -> String {
        guard let startDate = initialDate else { return textAPP.initialDateDefault }
        guard let endDate = finalDate else { return textAPP.finalDateDefault }
        
        let URL = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=\(startDate)&endtime=\(endDate)"
        return URL
    }
    
    func fetchDataFromAPI(completion: @escaping (Result<EarthquakeDataResponse, Error>) -> Void) {
        
        AF.request(getURL(), method: .get)
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
    
    init(initialDate: String? = nil, finalDate: String? = nil) {
        self.initialDate = initialDate
        self.finalDate = finalDate
    }
}

//
//  EarthquakeDataResponse.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 12-01-24.
//

import Foundation

struct EarthquakeDataResponse: Decodable {
    var type: String
    var metadata: MetadataStruct
    var features: [FeaturesStruct]
    var bbox: [Double]
}

struct MetadataStruct: Decodable {
    var generated: Int
    var url: String
    var title: String
    var status: Int
    var api: String
    var count: Int
}

struct FeaturesStruct: Decodable {
    var type: String
    var properties: PropertiesStruct
    var geometry: geometryStruct
    var id: String
}

struct PropertiesStruct: Decodable {
    var mag: Double?
    var place: String?
    var time: Int
    var updated: Int
    var tz: String?
    var url: String
    var detail: String
    var felt: Int?
    var cdi: Double?
    var mmi: Double?
    var alert: String?
    var status: String
    var tsunami: Int
    var sig: Int
    var net: String
    var code: String
    var ids: String
    var sources: String
    var types: String
    var nst: Int?
    var dmin: Double?
    var rms: Double
    var gap: Double?
    var magType: String?
    var type: String
    var title: String
}

struct geometryStruct: Decodable {
    var type: String
    var coordinates: [Double]
}


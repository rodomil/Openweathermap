//
//  WeatherStruct.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 11.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

struct WeatherStruct: Decodable {
    let weather: [EeatherData]
    let main: MainData
    let name: String
}

struct EeatherData: Decodable {
    let description: String
}

struct MainData: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

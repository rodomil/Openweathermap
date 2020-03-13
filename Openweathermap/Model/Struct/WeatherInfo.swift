//
//  WeatherInfo.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 13.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

class WeatherInfo {
    var name: String
    let temp: String
    let description: String
    let date: Date
    
    init?(data: NSDictionary) {
        guard let main = data["main"] as? NSDictionary,
            let temp = main["temp"] as? Double,
            let weather = data["weather"] as? [NSDictionary],
            let description = weather[0]["description"] as? String,
            let date = data["dt"] as? Int
            else { return nil }
        self.temp = String(Int(temp))
        self.description = description
        self.date = Date(timeIntervalSince1970: TimeInterval(date))
        self.name = ""
        
        guard let name = data["name"] as? String
            else { return }
        self.name = name
    }
}

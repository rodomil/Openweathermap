//
//  FiveDayStrict.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 13.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

struct FiveDayStrict: Decodable {
    let list: [List5Data]
    let city: CityData
    
    
}

struct CityData: Decodable {
    let name: String
}

struct List5Data: Decodable {
    let main: MainData
    let weather: [EeatherData]
    let dt_txt: String
    
    func getDate() -> String {
        return dt_txt.components(separatedBy: " ").first ?? ""
    }
    
    func getTime() -> String {
        return dt_txt.components(separatedBy: " ").last ?? ""
    }
}

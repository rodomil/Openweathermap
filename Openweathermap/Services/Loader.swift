//
//  Loader.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 11.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit
import Alamofire

class Loader {
    static func loadWeatherForecastAlamofire(completion: @escaping ([WeatherInfo]?) -> Void) {
        AF.request(host + fiveDayURL).responseJSON {
        response in
        if let objects = response.value,
            let jsonDict = objects as? NSDictionary,
            let list = jsonDict["list"] as? [NSDictionary] {
                var weatherInfos: [WeatherInfo] = []
                for data in list {
                    if let weatherInfo = WeatherInfo(data: data ) {
                        weatherInfos.append(weatherInfo)
                    }
                    DispatchQueue.main.async {
                        completion(weatherInfos)
                    }
                }
            }
        }
    }
}

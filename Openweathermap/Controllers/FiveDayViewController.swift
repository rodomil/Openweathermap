//
//  FiveDayViewController.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 13.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

class FiveDayViewController: UIViewController {

    @IBOutlet weak var nameTown: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var weatherInfos: [DateComponents: [WeatherInfo]] = [:]
    private var dates: [DateComponents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Loader.loadWeatherForecastAlamofire { (data) in
            guard let weatherInfos: [WeatherInfo] = data else {
                self.nameTown.text = errorLoad
                return
            }
            self.nameTown.text = "Прогноз погоды на 5 дней"
            self.weatherInfos = [:]
            self.dates = []
            for wi in weatherInfos {
                let wDate = Calendar.current.dateComponents([.year, .month, .day], from: wi.date)
                if (self.weatherInfos[wDate] == nil) {
                    self.weatherInfos[wDate] = []
                }
                self.weatherInfos[wDate]?.append(wi)
                if (!self.dates.contains(wDate)) {
                    self.dates.append(wDate)
                }
            }
            self.tableView.reloadData()
        }
    }

}

extension FiveDayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dates.count < section || dates.count == 0) { return 0 }
        return weatherInfos[dates[section]]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (dates.count < section || dates.count == 0 || weatherInfos[dates[section]] == nil) { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: weatherInfos[dates[section]]![0].date)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ForecastTableViewCell
        let section = indexPath.section
        if let model = weatherInfos[dates[section]]?[indexPath.row] {
            cell.initCell(model: model)
        }
        
        return cell
    }
}

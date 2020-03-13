//
//  ForecastTableViewCell.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 13.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var descriptionWeather: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(model: WeatherInfo) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        time.text = dateFormatter.string(from: model.date)
        descriptionWeather.text = model.description
        temperature.text = model.temp
    }

}

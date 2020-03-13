//
//  CurrentViewController.swift
//  Openweathermap
//
//  Created by Rodomil Rod on 11.03.2020.
//  Copyright © 2020 Rodomil Rod. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var nameTown: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var hydro: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    @IBOutlet weak var errorLable: UILabel!
    @IBOutlet weak var ai: UIActivityIndicatorView!
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    private func loadData() {
        APIManager.loadDataPOSTArray(structData: WeatherStruct.self, url: host + currentWeatherUrl) { (data) in
            DispatchQueue.main.async {
                if let data = data {
                
                    self.nameTown.text = data.name
                    self.temp.text = "\(Int(data.main.temp)) ℃"
                    self.desc.text = data.weather.first?.description
                    self.pressure.text = "\(Int(data.main.pressure)) гПа"
                    self.hydro.text =  "\(Int(data.main.humidity)) %"
                    self.maxTemp.text = "\(Int(data.main.temp_max)) ℃"
                    self.minTemp.text = "\(Int(data.main.temp_min)) ℃"
                    
                    self.infoView.isHidden = true
                
                
                
                } else {
                    self.ai.isHidden = true
                    self.errorLable.text = errorLoad
                }
            }
        }
    }
    

}


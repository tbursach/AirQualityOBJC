//
//  TJBDetailViewController.swift
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

import UIKit

class TJBDetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var cityAQILabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    @IBOutlet weak var cityHumidityLabel: UILabel!
    @IBOutlet weak var cityWindspeedLabel: UILabel!
    
    //MARK: - Properties
    
    var country: String?
    var state: String?
    var city: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCityDetails()
    }
    

    func fetchCityDetails() {
        guard let country = country else { return }
        guard let state = state else { return }
        guard let city = city else { return }
        TJBCityAirQualityController.fetchDataforCity(country, state: state, city: city) { (cityAQI) in
            if let details = cityAQI {
                self.updateViews(with: details)
            }
            
        }
    }
    
    func updateViews(with details: TJBCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = details.city
            self.cityStateLabel.text = "State: \(details.state)"
            self.cityCountryLabel.text = "Country: \(details.country)"
            self.cityAQILabel.text = "Air Quality Index: \(details.pollution.airQualityIndex)"
            self.cityTemperatureLabel.text = "Temperature: \(details.weather.temperature) degrees celcius"
            self.cityHumidityLabel.text = "Humidity: \(details.weather.humidity)"
            self.cityWindspeedLabel.text = "WindSpeed: \(details.weather.windSpeed)"
            
        }
    }
    
} // END OF CLASS

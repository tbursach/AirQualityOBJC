//
//  TJBCityListTableViewController.swift
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

import UIKit

class TJBCityListTableViewController: UITableViewController {

    //MARK: - Properties
    
    var country: String?
    
    var state: String?
    
    var cities: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCity()
    }
    
    //MARK: - Helpers
    
    func fetchCity() {
        guard let country = country else { return }
        guard let state = state else { return }
        TJBCityAirQualityController.fetchSupportedCities(inCountry: country, state: state) { (cities) in
            guard let cities = cities else { return }
            self.cities = cities
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        let city = cities[indexPath.row]
        cell.textLabel?.text = city

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let country = country,
                  let state = state,
                  let destinationVC = segue.destination as? TJBDetailViewController else { return }
            
            let selectedCity = cities[indexPath.row]
            destinationVC.city = selectedCity
            destinationVC.state = state
            destinationVC.country = country
        }
    }

}

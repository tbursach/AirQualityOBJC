//
//  TJBCountriesListTableViewController.swift
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

import UIKit

class TJBCountriesListTableViewController: UITableViewController {

    //MARK: - Properties
    
    var countries: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountry()
    }
    
    //MARK: - Helpers
    
    func fetchCountry() {
        TJBCityAirQualityController.fetchSupportedCountries { (countries) in
            guard let countries = countries else { return }
            self.countries = countries
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatesVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TJBStatesListTableViewController else { return }
            
            let selectedCountry = countries[indexPath.row]
            destinationVC.country = selectedCountry
        }
    }

}

//
//  TJBStatesListTableViewController.swift
//  AirQualityOBJC
//
//  Created by Trevor Bursach on 9/30/20.
//

import UIKit

class TJBStatesListTableViewController: UITableViewController {

    //MARK: - Properties
    
    var country: String?
    
    var states: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchState()
    }

    //MARK: - Helpers
    
    func fetchState() {
        guard let country = country else { return }
        TJBCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            guard let states = states else { return }
            self.states = states
        }
        }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let country = country,
                  let destinationVC = segue.destination as? TJBCityListTableViewController else { return }
            
            let selectedState = states[indexPath.row]
            destinationVC.country = country
            destinationVC.state = selectedState
        }
    }

}

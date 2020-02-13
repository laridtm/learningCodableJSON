//
//  ViewController.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cities: [City] = [City(name: "Florianópolis"),
                        City(name: "Palhoça"),
                        City(name: "São José"),
                        City(name: "Santo Amaro")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityTableViewCell
        
        cell?.setCity(city: cities[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
    }
}


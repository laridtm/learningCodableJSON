//
//  ViewController.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let decoder = JSONDecoder()
    
    var nameCities: [String] = []
    
    var city: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameCities.append("Florianopolis")
        nameCities.append("Imbituba")
        nameCities.append("Palhoça")
        
    }
        
    func loadCities(city: String) -> [City] {
        
        guard let fileURL = Bundle.main.url(forResource: city, withExtension: "json") else {
            print("couldn't find the file")
            return []
        }
        
        do {
            let content = try Data(contentsOf: fileURL)
            
            do {
                let arrCity = try decoder.decode([City].self, from: content)
                print(arrCity)
                return arrCity
            } catch {
                print(error)
            }
            
        } catch let error {
            print(error)
        }
        return []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityName") as? CityNameViewCell
        
        cell?.setNameCity(name: nameCities[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var index = indexPath.row
        city = nameCities[index]
        
        performSegue(withIdentifier: "DataCity", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dataCity = segue.destination as? DataCityViewController else {
            return
        }
        
        dataCity.selectedCity = loadCities(city: city)[0]
    }
    
}



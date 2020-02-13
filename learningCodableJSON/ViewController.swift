//
//  ViewController.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let json = """
    {
     "weather": [
        {
          "humidity": 67,
          "city": "Florianópolis",
          "min": 21,
          "max": 26
        },
        {
          "humidity": 57,
          "city": "Palhoça",
          "min": 20,
          "max": 26
        },
        {
          "humidity": 48,
          "city": "São José",
          "min": 11,
          "max": 18
        }
      ]
    }
    """.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    var weatherArr: DicWeather?
    
    var selected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            weatherArr = try decoder.decode(DicWeather.self, from: json)
            print(weatherArr?.weather)
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dataCity = segue.destination as? DataCity else {
            return
        }
        
        dataCity.weather = weatherArr?.weather[selected]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArr!.weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityTableViewCell
        
        cell?.setCity(city: weatherArr!.weather[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
    }
}

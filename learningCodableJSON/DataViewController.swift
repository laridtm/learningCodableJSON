//
//  DataViewController.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 12/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    let json = """
               {
                "weather": [
                   {
                     "humidity": 67,
                     "city": "Flonopx",
                     "min": 21,
                     "max": 26
                   },
                   {
                     "humidity": 57,
                     "city": "Palhoça",
                     "min": 20,
                     "max": 26
                   }
                 ]
               }
               """.data(using: .utf8)!

               let decoder = JSONDecoder()
               var weatherArr: DicWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

            do {
                weatherArr = try decoder.decode(DicWeather.self, from: json)
                print(weatherArr?.weather)
            } catch {
                print(error)
            }
    }
}

extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCity") as? DataCityTableViewCell
        
        cell?.setLabels(city: (weatherArr?.weather[indexPath.row])!)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
}

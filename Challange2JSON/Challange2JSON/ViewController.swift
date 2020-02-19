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
    
    var loadImage: UIImage?
    
    let session = URLSession.shared
    
    let urlRainy = URL(string: "https://centralca.cdn-anvilcms.net/media/images/2019/01/02/images/Rainy_Weather_pix.max-752x423.jpg")!
    let urlSunny = URL(string: "https://www.breakingbelizenews.com/wp-content/uploads/2019/06/Warm-weather.jpg")!
    let urlCloudy = URL(string: "https://hoodline.imgix.net/uploads/story/image/402715/istock__..featured_image_1..cloudy_2.jpg.jpg?auto=format")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameCities.append("Florianopolis")
        nameCities.append("Imbituba")
        nameCities.append("Palhoça")
        
        let task = session.dataTask(with: urlRainy) { data, response, error in
            if error == nil {
                DispatchQueue.main.async {
                    self.loadImage = UIImage(data: data!)
                }
            }
        }
        task.resume()
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
        
        cell?.nameCity.text = nameCities[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        city = nameCities[indexPath.row]
        
        performSegue(withIdentifier: "DataCity", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dataCity = segue.destination as? DataCityViewController else {
            return
        }
        
        dataCity.selectedCity = loadCities(city: city)[0]
        dataCity.name = city
        DispatchQueue.main.async {
            dataCity.imageCitylabel.image = self.loadImage
        }
    }
}



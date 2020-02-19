//
//  DataCityViewController.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class DataCityViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var imageCitylabel: UIImageView!
    
    var selectedCity: City?
    var name: String?
    
    let session = URLSession.shared
    
    var currentURL: URL?
    let weatherImageUrl = ["rainy": "https://centralca.cdn-anvilcms.net/media/images/2019/01/02/images/Rainy_Weather_pix.max-752x423.jpg",
                           "cloudy": "https://hoodline.imgix.net/uploads/story/image/402715/istock__..featured_image_1..cloudy_2.jpg.jpg?auto=format",
                           "sunny": "https://www.breakingbelizenews.com/wp-content/uploads/2019/06/Warm-weather.jpg"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentCity = selectedCity else {
            return
        }
        
        guard let url = URL(string: weatherImageUrl[currentCity.climate]!) else {
            fatalError()
        }
        
        let task = self.session.dataTask(with: url) { data, response, error in
            if error == nil {
                let loadImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageCitylabel.image = loadImage
                }
            }
        }
        task.resume()
        
        
        cityLabel.text = name
        humidityLabel.text = "\(currentCity.humidity)%"
        climateLabel.text = currentCity.climate
        tempMaxLabel.text = "\(currentCity.temperature[0].max)º"
        tempMinLabel.text = "\(currentCity.temperature[0].min)º"
        
        
    }
    
    
}

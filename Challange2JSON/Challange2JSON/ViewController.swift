//
//  ViewController.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let decoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCities()
    }
        
    func loadCities() -> [City] {
        
        guard let fileURL = Bundle.main.url(forResource: "Florianopolis", withExtension: "json") else {
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
    
    
    
}



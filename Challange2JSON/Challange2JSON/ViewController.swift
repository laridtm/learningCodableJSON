//
//  ViewController.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let json = """
    [
        {
            "humidity": 90,
            "climate": "rainy",
            "temperature": [
                {
                    "max": 30,
                    "min": 22
                }
            ]
        }
    ]
    """.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    var arrCity: City?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let arrCity = try decoder.decode([City].self, from: json)
            print(arrCity)
        } catch {
            print(error)
        }
        
    }


}


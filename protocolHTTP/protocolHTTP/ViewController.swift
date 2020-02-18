//
//  ViewController.swift
//  protocolHTTP
//
//  Created by Larissa Diniz  on 17/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        
        let task = session.dataTask(with: url) { data, response, error in
            print(data)
            print(response)
            print(error)
        }
        
        task.resume()
        
        
        
    }


}


//
//  ViewController.swift
//  learningURLSession
//
//  Created by Larissa Diniz  on 18/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageContent: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReMZvTBS_yG8iiCRTR5rPflFaE_nOPWn1Mc5cpSx0f6ROO-qqv")
        
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    let loadedImage = UIImage(data: data!)
                    self.imageContent.image = loadedImage
                    print(error)
                }
            }
        }
        task.resume()
    }


}


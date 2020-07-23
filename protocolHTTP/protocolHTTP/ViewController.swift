//
//  ViewController.swift
//  protocolHTTP
//
//  Created by Larissa Diniz  on 17/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let decoder = JSONDecoder()
    var arrPerson: [Person] = []
    
    let session = URLSession.shared
    let url = URL(string: "https://learnappmaking.com/ex/users.json")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = session.dataTask(with: url) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print(error)
                    return
            }
            
            do {
                self.arrPerson = try self.decoder.decode([Person].self, from: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    
    }
    
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonTableViewCell
        
        cell?.setLabels(person: arrPerson[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

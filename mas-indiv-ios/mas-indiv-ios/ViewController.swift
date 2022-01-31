//
//  ViewController.swift
//  mas-indiv-ios
//
//  Created by Saket Shirsath on 1/30/22.
//

import UIKit

class ViewController: UIViewController {

    var getPath = "https://w433eqelob.execute-api.us-east-2.amazonaws.com/getName?userID=1"
    var putPath = "https://w433eqelob.execute-api.us-east-2.amazonaws.com/updateName"
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getName()
    }

    func getName() -> String {
        
        var request = URLRequest(url: URL(string: getPath)!)
        request.httpMethod = "GET"
        var response1 = String()
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            let a = (String(data: data, encoding: .utf8)!)
            response1 = a
            print(a)
        })
        
        task.resume()
        //print(response1)
        return response1
    }
    
    func updateName(newName: String) {
        var request = URLRequest(url: URL(string: putPath)!)
        let data:  [String: Any] = ["userid" : 1, "name": newName]
        let finalBody = try? JSONSerialization.data(withJSONObject: data)

        request.httpMethod = "PUT"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
        })
        task.resume()
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        nameLabel.text = "asdf"
        
        updateName(newName: textField.text!)
        
    }
    
    
    
}


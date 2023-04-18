//
//  ApiViewController.swift
//  loginPage
//
//  Created by sanju pethani on 07/02/23.
//

import UIKit
import Alamofire

class ApiViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    private func loginAIP(){
        let parameters: Parameters = ["email" :"eve.holt@reqres.in", "password": "cityslicka"]
        AF.request("https://reqres.in/api/login", method: .post, parameters: parameters).responseData
        { response in
            debugPrint("Response: \(response)")
            if response.response?.statusCode == 200 {
                guard let apiData = response.data else { return }
                do{
                let loginApiResponse = try JSONDecoder().decode(LoginApiResponse.self, from: apiData)
                    print(loginApiResponse)
                } catch {
                    print("Parsing error")
                }
            } else {
                print("You did something wrong")
            }
        }
    }

}

extension UIViewController: UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell()
//        cell.textLabel?.text = "\()"
        return cell
    }
}

struct LoginApiResponse: Decodable {
    var token: String
}

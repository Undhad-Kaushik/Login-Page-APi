//
//  ViewController.swift
//  UserApiCalling
//
//  Created by Undhad Kaushik on 13/02/23.
//




import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var arrUser: [Dictionary<String, AnyObject>] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        xibFileRegistretion()
    }
    private func xibFileRegistretion(){
        let nibFile: UINib = UINib(nibName: "UserTableViewCell", bundle: nil)
        userTableView.register(nibFile, forCellReuseIdentifier: "UserTableViewCell")
        userTableView.separatorStyle = .none
    }
    private func getUser(){
//        guard let url = URL(string: "https://gorest.co.in/public/v2/todos") else { return }
        
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let aipdata = data else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: aipdata) as! [Dictionary<String, AnyObject>]
                self.arrUser = json
                DispatchQueue.main.async {
                    
                    self.userTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

}

extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        let tabelRow = arrUser[indexPath.row]
        cell.idLabel.text = "Id: \(tabelRow["id"] as! Double)"
        cell.nameLabel.text = "Name: \(tabelRow["name"] as! String)"
        cell.emailLabel.text = "Email: \(tabelRow["email"] as! String)"
        cell.genderLabel.text = "Gender: \(tabelRow["gender"] as! String)"
        cell.statusLabel.text = "Status: \(tabelRow["status"] as! String)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    
}


class User{
    var id: Double
    var name: String
    var email: String
    var gender: String
    var status: String
    
    init( userDetails: Dictionary<String, AnyObject>) {
        id = userDetails["id"] as! Double
        name = userDetails["name"] as! String
        email = userDetails["email"] as! String
        gender = userDetails["gender"] as! String
        status = userDetails["status"] as! String
    }
}



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        var arrUser: [LoginDetails] = []
        super.viewDidLoad()
    }
//    
//   private func getLoginDetails(completion: @escaping (Result<LoginDetails, Error>) -> Void) {
//        let url = URL(string: "https://reqres.in")!
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data was not retrieved from the API."])
//                completion(.failure(error))
//                return
//            }
//            do {
//                let loginDetails = try JSONDecoder().decode(LoginDetails.self, from: data)
//                completion(.success(loginDetails))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
    
//    private func getUsers() {
//        let url = URL(string: "https://api.example.com/endpoint")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error")
//                return
//            }
//            let response = String(data: data, encoding: .utf8)
//            print(response)
//        }
//        task.resume()
//    }
    
}


extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let rowDictionary = arrUsers[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(rowDictionary["name"] as! String)"
        return cell
    }
}

struct LoginDetails: Codable {
    var id: String
    var email: String
    var firstName: String
    var lastName: String
}

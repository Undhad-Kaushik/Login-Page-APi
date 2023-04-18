//
//  secondViewController.swift
//  loginPage
//
//  Created by sanju pethani on 07/03/34.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func button(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let apiViewController: ApiViewController = storyBoard.instantiateViewController(withIdentifier: "ApiViewController") as! ApiViewController
        navigationController?.pushViewController(apiViewController, animated: true)
        
    }
}

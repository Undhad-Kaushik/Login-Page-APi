//
//  joinViewController.swift
//  loginPage
//
//  Created by sanju pethani on 26/12/22.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if firstName.text == "" && lastName.text == "" && password.text == ""{
            displayValidation(massage: "Enter all Information")
        }else if lastName.text == "" && password.text == "" {
            displayValidation(massage: "Enter Lastname and Password")
        }else if  firstName.text == "" && lastName.text == "" {
            displayValidation(massage: "Enter Firstname and Lastname")
        }else if firstName.text == "" && password.text == "" {
            displayValidation(massage: "Enter Firstname and Password")
        }else if firstName.text == "" {
            displayValidation(massage: "enter First Name")
        }else if lastName.text == "" {
            displayValidation(massage: "Enter Last Name")
        }else if password.text == "" {
            displayValidation(massage: "Enter Password")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainPageViewController: MainPageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        navigationController?.pushViewController(MainPageViewController, animated: true)
    }
    private func displayValidation(massage: String) {
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { button in }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    func setCornerRadius(view: UIView?, cornerRadius: CGFloat) {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.masksToBounds = true
    }
}

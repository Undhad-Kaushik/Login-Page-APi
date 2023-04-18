//
//  ViewController.swift
//  loginPage
//
//  Created by sanju pethani on 22/12/22.
//

import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgatePassword: UIButton!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var enterEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        signInButton.layer.masksToBounds = true
        signInButton.layer.cornerRadius = 25
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        
        print("enter the valide pass")
        if enterEmail.text == "" && enterPassword.text == "" {
            displayValidation(massage: "Enter all Information")
        }else if enterPassword.text == "" {
            displayValidation(massage: "Enter the Password")
        }else if  enterEmail.text == "" {
            displayValidation(massage: "Enter the Email")
        }else if enterEmail.text?.count ?? 0 < 3 {
            displayValidation(massage: "Enter valid email")
        }else if enterPassword.text?.count ?? 0 < 8 {
            displayValidation(massage: "Enter valide Password")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainPageViewController: MainPageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        self.navigationController?.pushViewController(MainPageViewController, animated: true)
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
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ForgotPasswordViewController: ForgotPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(ForgotPasswordViewController, animated: true)
    }
    
    @IBAction func jointNowAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let JoinViewController: JoinViewController = storyBoard.instantiateViewController(withIdentifier: "JoinViewController") as! JoinViewController
        navigationController?.pushViewController(JoinViewController, animated: true)
    }
}


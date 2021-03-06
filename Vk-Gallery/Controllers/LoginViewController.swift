//
//  LoginViewController.swift
//  Vk-Gallery
//
//  Created by Андрей Воробьев on 25.03.2022.
//

import UIKit
import SwiftyVK

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.layer.cornerRadius = 10
        loginButtonOutlet.setTitle("mainButtonLogin".localized, for: [.normal])
        mainLabel.text = "mainLabel".localized
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if VK.sessions.default.accessToken != nil {
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let galerryVC = storyboard.instantiateViewController(identifier: "MyNavigationController") as! MyNavigationController
            self.present(galerryVC, animated: false)
        }
    }
    
    //MARK:- Action
    @IBAction func loginButtonAtcion(_ sender: Any) {
        if VK.sessions.default.accessToken == nil {
            DispatchQueue.global().async {  [weak self] in
                VK.sessions.default.logIn { info in
                    
                    DispatchQueue.main.async { [weak self] in
                        let storyboard = UIStoryboard(name: "Main", bundle: .main)
                        let galerryVC = storyboard.instantiateViewController(identifier: "MyNavigationController") as! MyNavigationController
                        self?.present(galerryVC, animated: true)
                    }
                    
                    print("Success", info)
                } onError: { error in
                    DispatchQueue.main.async { [weak self] in
                        self?.createAlertView(title: "mailAllertTitle".localized , massage: "mailAllertMessage".localized)
                    }
                    print("ERROR", error)
                }
            }
           
        }
    }
    
    //MARK:- createAlertView
    func createAlertView(title: String, massage: String) {
        let alert = UIAlertController.init(title: title, message: massage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "mailAllertButton".localized, style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

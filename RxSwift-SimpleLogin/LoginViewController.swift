//
//  ViewController.swift
//  RxSwift-SimpleLogin
//
//  Created by Jiyeon on 2021/10/27.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.tintColor = .white
            loginButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            loginButton.layer.cornerRadius = 15
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  ViewController.swift
//  RxSwift-SimpleLogin
//
//  Created by Jiyeon on 2021/10/27.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.keyboardType = .emailAddress
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.tintColor = .white
            loginButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            loginButton.layer.cornerRadius = 15
        }
    }
    
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    
    let userEmail = "jiyeonlab@gmail.com"
    let userPassword = "test1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupControl()
    }

    func setupControl() {
        emailTextField.rx.text
            .orEmpty
            .bind(to: viewModel.emailObserver)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .orEmpty
            .bind(to: viewModel.passwordObserver)
            .disposed(by: disposeBag)
        
        viewModel.isValid.bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValid
            .map { $0 ? 1 : 0.3 }
            .bind(to: loginButton.rx.alpha)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.subscribe(
            onNext: { [weak self] _ in
                if self?.userEmail == self?.viewModel.emailObserver.value &&
                    self?.userPassword == self?.viewModel.passwordObserver.value {
                    self?.showAlert(with: true)
                }else{
                    self?.showAlert(with: false)
                }
            }
        ).disposed(by: disposeBag)
    }
    
    func showAlert(with isSuccess: Bool) {
        var alert = UIAlertController()
        let ok = UIAlertAction(title: "확인", style: .default)
        
        if isSuccess {
            alert = UIAlertController(title: "로그인 성공", message: "환영합니다", preferredStyle: .alert)
        }else{
            alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호를 다시 확인해주세요", preferredStyle: .alert)
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}


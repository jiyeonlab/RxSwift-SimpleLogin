//
//  LoginViewModel.swift
//  RxSwift-SimpleLogin
//
//  Created by Jiyeon on 2021/10/27.
//

import RxSwift
import RxRelay

class LoginViewModel {
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver)
            .map { email, password in
                debugPrint("Email: \(email), Password: \(password)")
                
                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
            }
    }
}

//
//  RxSwiftInteractor.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/07/29.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RxSwiftBusinessLogic {
    func doSomething(request: RxSwift.Something.Request)
}

protocol RxSwiftDataStore {
    //var name: String { get set }
}

class RxSwiftInteractor: RxSwiftBusinessLogic, RxSwiftDataStore {
    var presenter: RxSwiftPresentationLogic?
    var worker: RxSwiftWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: RxSwift.Something.Request) {
        worker = RxSwiftWorker()
        worker?.doSomeWork()
            .subscribe(onNext: { _ in
                
            }, onError: { _ in
                
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
        
        let response = RxSwift.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

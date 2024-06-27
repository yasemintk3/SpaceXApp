//
//  LaunchesViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation

protocol LaunchesViewModelProtocol {
    func getLaunchesList()
}

final class LaunchesViewModel: LaunchesViewModelProtocol {
    
    // MARK: Properties
    
    private var httpClient: HttpClientProtocol?
    private var appCoordinator: AppCoordinator?
    
    // MARK: Init
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator

        getLaunchesList()
    }
    
    // MARK: Funcs
    
    func getLaunchesList() {
        
        httpClient?.fetch(url: Constants.generateLaunchesURL()!, completion: { (result: Result<Launches, Error>) in
            
            switch result {
            case .success(let response):
                let results = response
                print(results)
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
}

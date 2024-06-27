//
//  LaunchesViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation

enum LaunchesListViewModelState {
    case showLaunchList(LaunchesCellViewModel)
    case showError(String)
}

protocol LaunchesViewModelOutput: AnyObject {
    func updateView(_ state: LaunchesListViewModelState)
}

protocol LaunchesViewModelProtocol {
    var output: LaunchesViewModelOutput? { get set }
    
    func getLaunchesList()
}

final class LaunchesViewModel: LaunchesViewModelProtocol {
    
    // MARK: Properties
    
    weak var output: LaunchesViewModelOutput?
    private var httpClient: HttpClientProtocol?
    private var appCoordinator: AppCoordinator?
    
    // MARK: Init
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
    
    // MARK: Funcs
    
    func getLaunchesList() {
        
        httpClient?.fetch(url: Constants.generateLaunchesURL()!, completion: { (result: Result<Launches, Error>) in
            
            switch result {
            case .success(let response):
                let results = response
                let cellViewModel = LaunchesCellViewModel(result: results)
                self.output?.updateView(.showLaunchList(cellViewModel))
            case .failure(let error):
                self.output?.updateView(.showError(error.localizedDescription))
            }
        })
    }
}

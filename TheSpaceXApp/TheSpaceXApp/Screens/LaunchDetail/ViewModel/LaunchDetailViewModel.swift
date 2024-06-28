//
//  LaunchDetailViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation

enum LaunchDetailListViewModelState {
    case showLaunchDetail(LaunchDetailCellViewModel)
    case showError(String)
}

protocol LaunchDetailViewModelOutput: AnyObject {
    func updateView(_ state: LaunchDetailListViewModelState)
}

protocol LaunchDetailViewModelProtocol {
    var output: LaunchDetailViewModelOutput? { get set }
    
    func getLaunchDetail()
}

final class LaunchDetailViewModel: LaunchDetailViewModelProtocol {
    
    // MARK: Properties
    
    var output: LaunchDetailViewModelOutput?
    private var id: Int
    private var httpClient: HttpClientProtocol
    
    // MARK: Init
    
    init(id: Int, httpClient: HttpClientProtocol) {
        self.id = id
        self.httpClient = httpClient
        
        self.getLaunchDetail()
    }
    
    // MARK: Funcs
    
    func getLaunchDetail() {
        
        httpClient.fetch(url: Constants.generateDetailURL(id: id)!, completion: { [self] (result: Result<LaunchDetail, Error>) in
            
            switch result {
            case .success(let response):
                let results = response
                let detailCellViewModel = LaunchDetailCellViewModel(imagesResult: results)
                self.output?.updateView(.showLaunchDetail(detailCellViewModel))
            case .failure(let error):
                self.output?.updateView(.showError(error.localizedDescription))
            }
        })
    }
}

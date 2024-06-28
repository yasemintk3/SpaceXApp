//
//  LaunchDetailViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation

protocol LaunchDetailViewModelProtocol {

}

final class LaunchDetailViewModel: LaunchDetailViewModelProtocol {
    
    // MARK: Properties
    
    private var id: Int
    private var httpClient: HttpClientProtocol
    
    // MARK: Init
    
    init(id: Int, httpClient: HttpClientProtocol) {
        self.id = id
        self.httpClient = httpClient
        
        self.getLaunchDetail()
    }
    
    // MARK: Funcs
    
    private func getLaunchDetail() {
        
        httpClient.fetch(url: Constants.generateDetailURL(id: id)!, completion: { [self] (result: Result<LaunchDetail, Error>) in
            
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
}

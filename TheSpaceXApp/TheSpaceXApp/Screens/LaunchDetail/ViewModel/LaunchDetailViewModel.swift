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
    }
}

//
//  LaunchesViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation

final class LaunchesViewModel {
    
    // MARK: Properties
    
    private var httpClient: HttpClientProtocol?
    private var appCoordinator: AppCoordinator?
    
    // MARK: Init
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
}

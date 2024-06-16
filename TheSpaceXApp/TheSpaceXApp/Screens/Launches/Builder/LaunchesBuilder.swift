//
//  LaunchesBuilder.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation
import UIKit
import Alamofire

enum LaunchesBuilder {
    
    static func build(appCoordinator: AppCoordinator) -> LaunchesViewController {
        
        let httpClient = HttpClient(alamofireSession: Alamofire.Session.default)
        
        let viewModel = LaunchesViewModel(httpClient: httpClient, appCoordinator: appCoordinator)
        
        let delegate = LaunchesDelegate()
        let dataSource = LaunchesDataSource()
        
        let viewController = LaunchesViewController(viewModel: viewModel,
                                                    delegate: delegate,
                                                    dataSource: dataSource)
        
        return viewController
    }
}

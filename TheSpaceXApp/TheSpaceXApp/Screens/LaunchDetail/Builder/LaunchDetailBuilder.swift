//
//  LaunchDetailBuilder.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation
import UIKit
import Alamofire

enum LaunchDetailBuilder {
    
    static func build(id: Int) -> LaunchDetailViewController {
        
        let httpClient = HttpClient(alamofireSession: Alamofire.Session.default)
        
        let detailViewModel = LaunchDetailViewModel(id: id, httpClient: httpClient)
        
        let delegate = LaunchDetailDelegate()
        let dataSource = LaunchDetailDataSource()
        
        let viewController = LaunchDetailViewController(viewModel: detailViewModel,
                                                        delegate: delegate,
                                                        dataSource: dataSource)
        
        return viewController
    }
}

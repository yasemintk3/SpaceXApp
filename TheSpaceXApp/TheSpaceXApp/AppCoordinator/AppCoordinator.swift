//
//  AppCoordinator.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    func start()
    func launchSelected(id: Int)
}

class AppCoordinator: Coordinator {
    
    // MARK: Properties

    var navigationController: UINavigationController?
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Funcs
    
    func start() {
        let vc = LaunchesBuilder.build(appCoordinator: self)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func launchSelected(id: Int) {
        navigationController?.pushViewController(LaunchDetailBuilder.build(id: id), animated: true)
    }
}

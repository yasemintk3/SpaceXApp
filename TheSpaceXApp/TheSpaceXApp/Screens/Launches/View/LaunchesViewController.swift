//
//  LaunchesViewController.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import UIKit

class LaunchesViewController: UIViewController {
    
    // MARK: Properties

    private var viewModel: LaunchesViewModel?
    private var delegate: LaunchesDelegate?
    private var dataSource: LaunchesDataSource?
    
    // MARK: Init
    
    init(viewModel: LaunchesViewModel,
         delegate: LaunchesDelegate,
         dataSource: LaunchesDataSource) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//
//  LaunchDetailViewController.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import UIKit
import SnapKit

class LaunchDetailViewController: UIViewController {
    
    // MARK: Properties
    
    private var viewModel: LaunchDetailViewModelProtocol?
    
    // MARK: Init
    
    init(viewModel: LaunchDetailViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

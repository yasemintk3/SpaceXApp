//
//  LaunchesViewController.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 14.06.2024.
//

import UIKit
import SnapKit

class LaunchesViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LaunchesCollectionViewCell.self,
                                forCellWithReuseIdentifier: LaunchesCollectionViewCell.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

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
        
        self.title = "SpaceX Launches"
        
        viewModel?.output = self
        viewModel?.getLaunchesList()
        
        configureUI()
    }
    
    // MARK: Funcs
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureDelegate()
        configureContraints()
    }
    
    private func configureDelegate() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let sizeCalculator = CellSize(flowLayout: flowLayout, width: UIScreen.main.bounds.size.width)
            collectionView.contentInset = sizeCalculator.contentInset
            collectionView.collectionViewLayout = sizeCalculator.getFlowLayout()
        }
    }
    
    private func configureContraints() {
        
        view.addSubview(collectionView)
        
        launchesCollectionView()
    }
    
    private func launchesCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: Extensions

extension LaunchesViewController: LaunchesViewModelOutput {
    func updateView(_ state: LaunchesListViewModelState) {
        switch state {
        case .showLaunchList(let cellViewModel):
            delegate?.update(cellViewModel: cellViewModel, output: self)
            dataSource?.update(cellViewModel: cellViewModel)
            collectionView.reloadData()
        case .showError(let error):
            showAlert(message: error)
        }
    }
}

extension LaunchesViewController: LaunchesDelegateOutput {
    func didSelectItem(id: Int) {
        viewModel?.goToDetail(id: id)
    }
}

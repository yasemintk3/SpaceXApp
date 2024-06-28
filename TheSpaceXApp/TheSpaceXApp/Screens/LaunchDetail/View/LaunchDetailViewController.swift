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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LaunchDetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: LaunchDetailCollectionViewCell.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private var viewModel: LaunchDetailViewModelProtocol?
    private var delegate: LaunchDetailDelegate?
    private var dataSource: LaunchDetailDataSource?
    
    // MARK: Init
    
    init(viewModel: LaunchDetailViewModelProtocol,
         delegate: LaunchDetailDelegate,
         dataSource: LaunchDetailDataSource) {
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
        
        viewModel?.output = self
        
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
        
        launchImagesCollectionView()
    }
    
    private func launchImagesCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.size.height / 3.4)
        }
    }
}

// MARK: Extensions

extension LaunchDetailViewController: LaunchDetailViewModelOutput {
    func updateView(_ state: LaunchDetailListViewModelState) {
        switch state {
        case .showLaunchDetail(let detailCellViewModel):
            delegate?.update(detailCellViewModel: detailCellViewModel)
            dataSource?.update(detailCellViewModel: detailCellViewModel)
            collectionView.reloadData()
        case .showError(let error):
            showAlert(message: error)
        }
    }
}

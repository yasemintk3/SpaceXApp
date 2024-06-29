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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var flightNumber: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private lazy var missionName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private lazy var launchYear: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private lazy var launchDetails: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        return label
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
        
        navigationController?.navigationBar.tintColor = .black
        
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
        view.addSubview(stackView)
        stackView.addArrangedSubview(flightNumber)
        stackView.addArrangedSubview(missionName)
        stackView.addArrangedSubview(launchYear)
        view.addSubview(launchDetails)
        
        launchImagesCollectionView()
        stackViewConstraints()
        launchDetailsConstraints()
    }
    
    private func launchImagesCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.size.height / 2.3)
        }
    }
    
    private func stackViewConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(view.frame.size.height / 8)
        }
    }
    
    private func launchDetailsConstraints() {
        
        launchDetails.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    private func setData() {
        
        guard let viewModel = viewModel else { return }
        
        flightNumber.text = viewModel.getFlightNumber()
        missionName.text = viewModel.getMissionName()
        launchYear.text = viewModel.getLaunchYear()
        launchDetails.text = viewModel.getLaunchDetails()
    }
}

// MARK: Extensions

extension LaunchDetailViewController: LaunchDetailViewModelOutput {
    
    func updateDetailView(_ state: LaunchDetailListViewModelState) {
        switch state {
        case .showLaunchDetail(let detailCellViewModel):
            delegate?.update(detailCellViewModel: detailCellViewModel)
            dataSource?.update(detailCellViewModel: detailCellViewModel)
            collectionView.reloadData()
        case .setData:
            self.setData()
        case .showError(let error):
            showAlert(message: error)
        }
    }
}

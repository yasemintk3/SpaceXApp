//
//  LaunchesCollectionViewCell.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import UIKit

class LaunchesCollectionViewCell: UICollectionViewCell {
    
    private enum Constant {
        static let viewCornerRadius: CGFloat = 8
        static let viewCornerLineWidth: CGFloat = 1
        static let minOffSet: CGFloat = 8
    }
    
    // MARK: Properties
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var flightNumber: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var missionName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var upcomingSituation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: Funcs
    
    func configure(flightNumber: Int, missionName: String, upcomingSituation: Bool) {
        configureCell()
        configureFlightNumber(number: flightNumber)
        configureMissionName(name: missionName)
        configureUpcomingSituation(situation: upcomingSituation)
    }
    
    private func configureCell() {
        configureUI()
        configureConstaints()
    }
    
    private func configureUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(flightNumber)
        stackView.addArrangedSubview(missionName)
        stackView.addArrangedSubview(upcomingSituation)
        
        self.layer.cornerRadius = Constant.viewCornerRadius
        self.layer.borderWidth = Constant.viewCornerLineWidth
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
    }
    
    private func configureConstaints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    private func configureFlightNumber(number: Int) {
        flightNumber.text = "\(number)"
    }
    
    private func configureMissionName(name: String) {
        missionName.text = name
    }
    
    private func configureUpcomingSituation(situation: Bool) {
        upcomingSituation.text = "Upcoming: \(String(situation))"
    }
}

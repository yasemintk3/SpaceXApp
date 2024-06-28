//
//  LaunchDetailCollectionViewCell.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import UIKit
import Kingfisher

class LaunchDetailCollectionViewCell: UICollectionViewCell {
    
    private enum Constant {
        static let viewCornerRadius: CGFloat = 8
        static let viewCornerLineWidth: CGFloat = 1
        static let minOffSet: CGFloat = 8
    }
    
    // MARK: Properties
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        return image
    }()
    
    // MARK: Funcs
    
    func configure(imageURL: URL) {
        configureCell()
        configureImage(url: imageURL)
    }
    
    private func configureCell() {
        configureUI()
        configureConstaints()
    }
    
    private func configureUI() {
        contentView.addSubview(image)
        
        self.layer.cornerRadius = Constant.viewCornerRadius
        self.layer.borderWidth = Constant.viewCornerLineWidth
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
    }
    
    private func configureConstaints() {
        image.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    private func configureImage(url: URL) {
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 1).isActive = true
        image.kf.setImage(with: url)
    }
}

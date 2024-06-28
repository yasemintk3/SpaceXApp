//
//  LaunchDetailCellViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation
import UIKit

class LaunchDetailCellViewModel {
    
    // MARK: Properties
    
    private var imagesResult: LaunchDetail
    
    // MARK: Init
    
    init(imagesResult: LaunchDetail) {
        self.imagesResult = imagesResult
    }
    
    var imageCount: Int {
        imagesResult.links?.flickrImages?.count ?? 0
    }
    
    // MARK: Funcs
    
    func getImage(by indexPath: IndexPath) -> URL {
        
        let url = URL(string: imagesResult.links?.flickrImages?[indexPath.row] ?? "")
        return url ?? Constants.emptyImageURL
    }
}

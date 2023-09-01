//
//  BaseCollectionViewCell.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ConfigureBaseProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureViews() {
        
    }
    
    func setConstraints() {
        
    }
}

//
//  SearchCollectionViewCell.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
        
    override func configureViews() {
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

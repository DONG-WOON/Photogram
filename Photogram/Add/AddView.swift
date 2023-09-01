//
//  AddView.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

class AddView: BaseView {
    
    let backgroundShadowView = UIView()
    let imageView = UIImageView(.systemGray5)
    let searchButton = UIButton()
    
    override func configureViews() {
        super.configureViews()
       
        addSubview(backgroundShadowView)
        backgroundShadowView.addSubview(imageView)
        
        addSubview(searchButton)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    override func setAttributes() {
        
        backgroundShadowView.backgroundColor = UIColor(white: 0.15, alpha: 1)
        backgroundShadowView.layer.cornerRadius = 10
        backgroundShadowView.layer.shadowColor = UIColor.black.cgColor
        backgroundShadowView.layer.shadowOffset = .zero
        backgroundShadowView.layer.shadowRadius = 10
        backgroundShadowView.layer.shadowOpacity = 1
        
        imageView.layer.cornerRadius = 10
        
        searchButton.clipsToBounds = true
        searchButton.layer.cornerRadius = 10
        searchButton.setTitle("사진 가져오기", for: .normal)
        searchButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        searchButton.backgroundColor = .black
        searchButton.setTitleColor(.white, for: .normal)
    }
    
    override func setConstraints() {
        
        backgroundShadowView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(40)
            make.height.equalTo(backgroundShadowView.snp.width).multipliedBy(1.4)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        searchButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(backgroundShadowView)
            make.top.equalTo(backgroundShadowView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
}

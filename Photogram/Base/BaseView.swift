//
//  BaseView.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

class BaseView: UIView, ConfigureBaseProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        setAttributes()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureViews() { }
    func setAttributes() { }
    func setConstraints() { }
}

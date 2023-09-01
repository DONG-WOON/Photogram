//
//  Extension+UIView.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit

extension UIView {
    convenience init(_ backgroundColor: UIColor) {
        self.init()
        
        self.backgroundColor = backgroundColor
    }
}

extension UIView: Identifiable { }

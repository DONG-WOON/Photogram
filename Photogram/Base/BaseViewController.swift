//
//  BaseViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController, ConfigureBaseProtocol {
    
    override func loadView() {
        super.loadView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        setConstraints()
    }
    
    deinit {
        print("Base")
        print(self)
    }
    
    func configureViews() {
        view.backgroundColor = .systemBackground
    }
    
    func setConstraints() {
    }
}

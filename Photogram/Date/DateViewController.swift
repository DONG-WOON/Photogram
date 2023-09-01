//
//  DateViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/29/23.
//

import UIKit

class DateViewController: BaseViewController {
    let mainView = DateView()
    
    weak var delegate: (any DateReceivable)?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        delegate?.receive(mainView.picker.date)
    }
}

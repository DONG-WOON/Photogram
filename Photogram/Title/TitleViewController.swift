//
//  TitleViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/29/23.
//

import UIKit

class TitleViewController: BaseViewController {
    
    var receiveTextAction: (String) -> Void = { Text in }
    
    let textField = {
        let view = UITextField()
        view.placeholder = "제목"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        guard let text = textField.text, !text.isEmpty else { return }
        receiveTextAction(text)
    }
    
    override func configureViews() {
        super.configureViews()
        
        view.addSubview(textField)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
}

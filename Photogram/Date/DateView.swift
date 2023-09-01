//
//  DateView.swift
//  Photogram
//
//  Created by 서동운 on 8/29/23.
//

import UIKit

class DateView: BaseView {
    
    let picker: UIDatePicker = {
        let datePicker = UIDatePicker(.white)
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    override func configureViews() {
        super.configureViews()
        self.addSubview(picker)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        picker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}

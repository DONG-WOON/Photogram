//
//  DataReceivable.swift
//  Photogram
//
//  Created by 서동운 on 8/29/23.
//

import UIKit

protocol DataReceivable: AnyObject {
    associatedtype T
    
    func receive(_ data: T)
}

extension DataReceivable {
    func receive(_ data: T) {
    }
}

protocol ImageReceivable: DataReceivable {
    func receive(_ data: UIImage?)
}

protocol DateReceivable: DataReceivable {
    func receive(_ data: Date)
}


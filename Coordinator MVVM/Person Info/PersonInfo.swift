//
//  PersonInfos.swift
//  Coordinator MVVM
//
//  Created by Arthur Monteiro on 11/06/22.
//

import Foundation

protocol PersonInfo {
    var coordinator: Coordinator { get set }
    
    func didButtonTapAction()
}

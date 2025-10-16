//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 10/7/25.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0) // what tha HECK is $0, my guy?
        })
    }
}

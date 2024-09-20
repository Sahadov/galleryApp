//
//  UIFont_Extension.swift
//  galleryApp
//
//  Created by Дмитрий Волков on 19.09.2024.
//

import UIKit

extension String {
    func shorted(to symbols: Int) -> String {
        guard self.count > symbols else {
            return self
        }
        return self.prefix(symbols) + " ..."
    }
}

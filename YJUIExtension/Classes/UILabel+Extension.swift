//
//  UILabel+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation

extension UILabel {
    convenience init(font: UIFont, color: UIColor, alignment: NSTextAlignment, titleString: String = "") {
        self.init()
        self.font = font
        text = titleString
        textColor = color
        textAlignment = alignment
    }
}

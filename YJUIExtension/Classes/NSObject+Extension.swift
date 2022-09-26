//
//  NSObject+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}

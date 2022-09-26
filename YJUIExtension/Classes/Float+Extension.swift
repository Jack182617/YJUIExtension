//
//  Float+Extension.swift
//  YuChat
//
//  Created by yzsy on 2022/8/2.
//

import Foundation

public extension Float {
    func decimalString(point: Int) -> String {
        return String(format: "%.\(point)f", self)
    }
}

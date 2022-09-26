//
//  Date+Extension.swift
//  YuChat
//
//  Created by yzsy on 2022/6/30.
//

import Foundation
extension Date {
    public func toZone(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: "Asia/Shanghai")
        return formatter.string(from: self)
    }
}

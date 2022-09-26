//
//  Int+Extension.swift
//  YuChat
//
//  Created by yzsy on 2022/6/30.
//

import Foundation
/// 时间格式化
extension Int {
    func time(format: String = "yyyy-MM-dd HH:mm") -> String {
        let timeInterval = TimeInterval(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: "Asia/Shanghai")
        return formatter.string(from: date)
    }

    func timeForCustom() -> String {
        let timeDate = Date(timeIntervalSince1970: TimeInterval(self))
        if timeDate.isToday {
            return timeDate.toZone(format: "HH:mm")
        } else {
            return timeDate.toZone(format: "MM-dd")
        }
    }
    
    var boolValue: Bool {
        return self > 0
    }
}

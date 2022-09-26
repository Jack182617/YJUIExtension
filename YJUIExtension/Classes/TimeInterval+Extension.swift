//
//  TimeInterval+Extension.swift
//  YuChat
//
//  Created by Harwyn Tan on 2022/8/4.
//

import Foundation
/// 时间格式化
extension TimeInterval {
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
}

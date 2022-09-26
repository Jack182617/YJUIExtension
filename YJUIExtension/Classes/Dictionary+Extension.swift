//
//  Dictionary+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/8/31.
//

import Foundation

extension Dictionary {
    func toJsonString() -> String {
        guard JSONSerialization.isValidJSONObject(self) else { return "" }
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: []) else { return "" }
        guard let JSONString = String(data: data, encoding: .utf8) else { return "" }
        return JSONString
    }
}

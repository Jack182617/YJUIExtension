//
//  Array+Extension.swift
//  YuChat
//
//  Created by fusong zhang on 2022/8/8.
//

import Foundation

extension Array {
    /// 删除第一个
    mutating func safeRemoveFirst() {
        if !isEmpty { removeFirst() }
    }
}

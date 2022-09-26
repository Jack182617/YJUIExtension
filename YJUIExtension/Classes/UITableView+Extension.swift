//
//  UITableView+Extension.swift
//  YuChat
//
//  Created by Harwyn Tan on 2022/7/27.
//

extension UITableView {
    func register(_ cellClass: [AnyClass]) {
        for item in cellClass {
            register(item, forCellReuseIdentifier: NSStringFromClass(item))
        }
    }
}

//
//  UIViewController+Extension.swift
//  YuChat
//
//  Created by yzsy on 2022/6/29.
//

import Foundation
extension UIViewController {
    /// 返回当前的View Controller
    ///
    /// - Parameter base: 迭代起点
    /// - Returns: 当前的View Controller
    class func getCurrentViewController(base: UIViewController? = mainWindowInScenes?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getCurrentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return getCurrentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return getCurrentViewController(base: presented)
        }
        return base
    }
    
    /// 底部选择弹窗
    /// - Parameters:
    ///   - data: 带图标和文字的模型
    ///   - selected: 选择中的选项
    func showSheetAlert(data: [SheetViewModel], style: SheetViewCellStyle = .iconTitleLeft, selected: @escaping (Int) -> Void) {
        let bodyView = SheetView(listData: data, style: style)
        let vc = AlertController(.sheet, view: bodyView, width: SCREEN_WIDTH, height: CGFloat(data.count * 54 + 58))
        bodyView.sureAction = { [weak self] index in
            guard let self = self else { return }

            self.dismiss(animated: false) {
                selected(index)
            }
        }
        bodyView.cancelAction = { [weak self] in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
        }
        presentBottom(controller: vc)
    }
    
    //取消和确定弹出框
    func showDefaultAlertView(titleStr:String,canculBlock:@escaping YFNoneBlock,successBlock:@escaping YFNoneBlock) {
        let bodyView = AlertTreeView()
        bodyView.titleLabel.text = titleStr
        let alertVC = AlertController(.alert, view: bodyView, width: SCREEN_WIDTH - 76, height: 170, clickDismiss: true)
        
        navTopVC?.presentCenter(controller: alertVC)
        weak var weakVC = alertVC
        bodyView.closeAction = {
           
            weakVC?.dismissCenter()
            canculBlock()
        }
        
        bodyView.enterAction = {
            weakVC?.dismissCenter()
            successBlock()
        }
        //
    }

   
    
   
}

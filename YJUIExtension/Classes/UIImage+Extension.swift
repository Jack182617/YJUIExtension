//
//  Image+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation

extension UIImage {
    
    /// 根据颜色生成图片
    class func imageFromColor(_ color: UIColor = .white, size: CGSize = CGSize(width: SCREEN_WIDTH, height: 1)) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        UIGraphicsBeginImageContext(rect.size)

        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let tempImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return tempImage!
    }
    
    /// 修复图片旋转
    func fixOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }

        var transform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)

        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)

        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi / 2)

        default:
            break
        }

        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)

        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)

        default:
            break
        }

        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0, space: cgImage!.colorSpace!, bitmapInfo: cgImage!.bitmapInfo.rawValue)
        ctx?.concatenate(transform)

        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.height), height: CGFloat(size.width)))

        default:
            ctx?.draw(cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height)))
        }

        let cgimg: CGImage = (ctx?.makeImage())!
        let img = UIImage(cgImage: cgimg)

        return img
    }

    /// 根据 limit 压缩图片, 限制 为 1280
    func compressImage(limit: CGFloat = 1279.99) -> Data? {
        var w = size.width
        var h = size.height

        if w > limit, h > limit {
            if w > h {
                let scale = h / w
                w = limit
                h = w * scale

            } else {
                let scale = w / h
                h = limit
                w = h * scale
            }
        } else if w > limit, h < limit {
            let scale = h / w
            w = limit
            h = w * scale

        } else if w < limit, h > limit {
            let scale = w / h
            h = limit
            w = h * scale
        }

        UIGraphicsBeginImageContext(CGSize(width: w, height: h))
        draw(in: CGRect(x: 0, y: 0, width: w, height: h), blendMode: .normal, alpha: 1.0)
        let tempImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let newImage = tempImage else {
            return nil
        }

        if let data = newImage.jpegData(compressionQuality: 1.0) {
            switch data.count {
            case 0 ..< 200 * 1024:
                return data
            case 200 * 1024 ..< 512 * 1024: /// 0.25 ~ 0.5M
                return newImage.jpegData(compressionQuality: 0.9)
            case 512 * 1024 ..< 1024 * 1024: /// 0.5M ~ 1M
                return newImage.jpegData(compressionQuality: 0.8)
            default: /// 1M以及以上
                return newImage.jpegData(compressionQuality: 0.7)
            }
        } else {
            return newImage.pngData()
        }
    }

    /// 从中间位置拉伸图片
    class func stretchImage(name: String) -> UIImage? {
        guard let newImage = UIImage(named: name) else {
            return nil
        }

        let width = newImage.size.width
        let height = newImage.size.height
        let streImage = newImage.stretchableImage(withLeftCapWidth: Int(width / 2), topCapHeight: Int(height / 2))
        return streImage
    }

    /// 从中间位置拉伸图片
    class func stretch(image: UIImage?) -> UIImage? {
        guard let newImage = image else {
            return nil
        }
        let width = newImage.size.width
        let height = newImage.size.height
        let streImage = newImage.stretchableImage(withLeftCapWidth: Int(width / 2), topCapHeight: Int(height / 2))
        return streImage
    }

}

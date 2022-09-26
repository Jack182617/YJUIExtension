//
//  UIImageView+Extension.swift
//  YuChat
//
//  Created by 张川 on 2022/6/29.
//

import Foundation
import Kingfisher

extension UIImageView {
    // 获取需要下载的图片
    func netDownLoadImage(_ string: String, placeholder: UIImage? = nil, completed: SDExternalCompletionBlock? = nil) {
        sd_setImage(with: URL(string: string), placeholderImage: placeholder, completed: completed)
    }

    /// 获取圆形图片(服务器裁剪)
    func netRoundedImage(_ string: String, placeholder: UIImage? = nil, completed: SDExternalCompletionBlock? = nil) {
        sd_setImage(with: string.netRoundedImageUrl, placeholderImage: placeholder, completed: completed)
    }

    // 获取网络图片
    func netImage(_ string: String?,
                  placeholder: UIImage? = R.image.icon_common_placeholder(),
                  completed: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        image = placeholder
        guard let url = URL(string: string) else { return }
        kf.setImage(with: url, placeholder: placeholder, completionHandler: completed)
    }

    func netAvatar(_ string: String?,
                   placeholder: UIImage? = R.image.icon_common_placeholder(),
                   completed: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        if let string = string,
           let url = URL(string: string) {
            kf.setImage(with: url, placeholder: placeholder, completionHandler: completed)
        } else {
            image = R.image.icon_common_avatar_default()
        }
    }

    /// 预览视频第一帧
    func preVideoImage(_ urlString: String, callBack: ((UIImage) -> Void)? = nil) {
        DispatchQueue.global().async {
            guard let videoURL = URL(string: urlString)
            else { return }

            let asset = AVURLAsset(url: videoURL, options: nil)
            let durationTime = asset.duration
            let assetGen = AVAssetImageGenerator(asset: asset)
            assetGen.appliesPreferredTrackTransform = true
            assetGen.requestedTimeToleranceAfter = .zero
            assetGen.requestedTimeToleranceBefore = .zero

            let time = CMTimeMakeWithSeconds(0, preferredTimescale: 600)
            var actualTime = CMTimeMake(value: durationTime.value, timescale: durationTime.timescale)
            do {
                let image = try assetGen.copyCGImage(at: time, actualTime: &actualTime)
                let data = UIImage(cgImage: image).compressImage(limit: 200)
                DispatchQueue.main.async {
                    if let data = data, let new = UIImage(data: data) {
                        self.image = new
                        callBack?(new)
                    } else {
//                        self.image = R.image.fail_placeholder_60()
                    }
                }
            } catch {
                DispatchQueue.main.async {
//                    self.image = R.image.fail_placeholder_60()
                }
            }
        }
    }
}

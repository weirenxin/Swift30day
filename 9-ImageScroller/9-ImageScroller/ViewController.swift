//
//  ViewController.swift
//  9-ImageScroller
//
//  Created by weirenxin on 2016/12/29.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var imageView: UIImageView = {
        return UIImageView(image: UIImage(named: "steve"))
    }()
    private lazy var scrollView: UIScrollView = {[weak self] in
        
        let scrollView = UIScrollView(frame: (self?.view.bounds)!)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = (self?.imageView.bounds.size)!
        scrollView.delegate = self
        return scrollView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollViewSize: scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
           scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    
    private func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.bounds.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 : 0
        
         scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
         return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
         recenterImage()
    }
}


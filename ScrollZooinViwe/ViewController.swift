//
//  ViewController.swift
//  ScrollZooinViwe
//
//  Created by yunyoung ju on 2021/02/06.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    var image=["bg1.png","bg2.png","bg3.png","bg4.png"]
    var frame = CGRect.zero


    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.blue
        return scrollView
        
    }()

    
    
 /*   func inint(_ imageName:[String]){
        for i in 0 ... imageName.count{
            image.append(UIImage(named: imageName[i])!)
        }
        
    }
   */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        setupScreens()
    
    }
    
    func setupScreens() {
        for index in 0..<image.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            let imageScrollView = ImageScrollView(frame: frame)
            imageScrollView.set(image: UIImage(named: image[index])!)
            imageScrollView.tag = index+1
            self.scrollView.addSubview(imageScrollView)
        }

        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(image.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        let srollview:ImageScrollView = self.view.viewWithTag(Int(pageNumber+1)) as! ImageScrollView
        srollview.zoomScale = srollview.minimumZoomScale

    }
}


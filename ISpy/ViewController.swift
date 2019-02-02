//
//  ViewController.swift
//  ISpy
//
//  Created by Mark Meretzky on 2/1/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!;
    @IBOutlet weak var imageView: UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self;
        updateZoomFor(size: view.frame.size);
    }
    
    //Called when the scrollView has been given its correct size.
    
    override func viewDidLayoutSubviews() {
        //Zoom far enough out to see the entire image.
        scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false);
    }
    
    //Let the user zoom far enough out to see the entire image, but no farther.

    func updateZoomFor(size: CGSize) {
        let widthScale: CGFloat = size.width / imageView.frame.width;
        let heightScale: CGFloat = size.height / imageView.frame.height;
        scrollView.minimumZoomScale = min(widthScale, heightScale);
    }
    
    //MARK: UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView;
    }
    
    //If the content does not fill the entore scrollview, center the content.

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let top:  CGFloat = max((scrollView.frame.height - scrollView.contentSize.height) / 2, 0);
        let left: CGFloat = max((scrollView.frame.width  - scrollView.contentSize.width)  / 2, 0);
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: 0, right: 0);
    }

}

//
//  AddUpdateViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/13/21.
//

import UIKit

class AddUpdateViewController: UIViewController, Storyboarded {
    var coordinator: AddUpdateCoordinator?
    @IBOutlet var scrollView: UIScrollView!
    
    var contentWidth: CGFloat?
    var contentHeight: CGFloat?
    
    lazy var updateImageView: UpdateImageView = {
        let view = UpdateImageView()
        view.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
//        view.frame.size = CGSize(width: contentWidth!, height: 200)
        view.frame = CGRect(x: 0, y: 100, width: contentWidth!, height: 300)
        return view
    }()
    
    /* initialize each of the views
        - view with the image button and image view in the center
        - date input view
        - notes text view
        - "Did you work on this plant?" view
        - "How is your plant doing?" view
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = MyColor.updateBackground
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    
        contentWidth = scrollView.bounds.width
        contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSize(width: contentWidth!, height: contentHeight! * 2)
        
        scrollView.addSubview(updateImageView)

//        updateImageView.frame = CGRect(x: 0, y: 50, width: contentWidth, height: 250)
        
        
    }

}

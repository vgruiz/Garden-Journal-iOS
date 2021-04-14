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
    
    /* initialize each of the views
        - view with the image button and image view in the center
        - date input view
        - notes text view
        - "Did you work on this plant?" view
        - "How is your plant doing?" view
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.backgroundColor = UIColor.systemPink
    }

}

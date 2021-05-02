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
    
//    var contentWidth: CGFloat?
//    var contentHeight: CGFloat?
    
    
    
//    lazy var updateImageView: UpdateImageView = {
////        let view = UpdateImageView(frame: CGRect(x: 0, y: 0, width: contentWidth!, height: 235))
//        let view = UpdateImageView.instanceFromNib()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
//        view.frame = CGRect(x: 0, y: 0, width: contentWidth!, height: 235)
//        return view
//    }()
    
    private func makeUpdateImageView() -> UpdateImageView {
        let view = UpdateImageView.instanceFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
        return view
    }
    
    /* initialize each of the views
        - view with the image button and image view in the center
        - date input view
        - notes text view
        - "Did you work on this plant?" view
        - "How is your plant doing?" view
     */
    
    override func loadView() {
        super.loadView()

        // MARK: Setup scrollView
        scrollView.backgroundColor = MyColor.updateBackground
        scrollView.frame = self.view.bounds
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
//        let updateImageView = makeUpdateImageView(frame: scrollView.bounds)
//        scrollView.addSubview(updateImageView)
//        NSLayoutConstraint.activate([
//            updateImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            updateImageView.heightAnchor.constraint(equalToConstant: updateImageView.viewHeight),
//            updateImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            updateImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
//        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentWidth = scrollView.bounds.width
        let contentHeight = scrollView.bounds.height * 2
        
        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
    
//        let subviewHeight = CGFloat(230)
//        let currentViewOffset = CGFloat(0);

        layoutCustomSubviews()
    }
    
    private func layoutCustomSubviews() {
        let subview = makeUpdateImageView()
        subview.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
        scrollView.addSubview(subview)
        
        let dateView = UpdateDateView.instanceFromNib()
        dateView.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color2
        scrollView.addSubview(dateView)
        
        let notesView = UpdateNotesView.instanceFromNib()
        notesView.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color3
        notesView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(notesView)
        
        let workView = UpdateWorkView.instanceFromNib()
        workView.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color0
        workView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(workView)
        
        let statusView = UpdateStatusView.instanceFromNib()
        statusView.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
        statusView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(statusView)
        
        NSLayoutConstraint.activate([
            // MARK: Image View
            subview.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            subview.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            subview.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            subview.heightAnchor.constraint(equalToConstant: 230),
            
            //MARK: Date View
            dateView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dateView.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 24),
            dateView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            dateView.heightAnchor.constraint(equalToConstant: 75),
            
            //MARK: Notes View
            notesView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            notesView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 24),
            notesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            notesView.heightAnchor.constraint(equalToConstant: 120),
            
            //MARK: Work View
            workView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            workView.topAnchor.constraint(equalTo: notesView.bottomAnchor, constant: 24),
            workView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            workView.heightAnchor.constraint(equalToConstant: 160),
            
            //MARK: Status View
            statusView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            statusView.topAnchor.constraint(equalTo: workView.bottomAnchor, constant: 24),
            statusView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            statusView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }

}

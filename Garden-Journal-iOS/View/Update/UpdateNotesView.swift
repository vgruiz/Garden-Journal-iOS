//
//  UpdatesNotesView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 5/1/21.
//

import UIKit

class UpdateNotesView: UIView {

    @IBOutlet var notesTextView: UITextView!
    
    let edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    class func instanceFromNib() -> UpdateNotesView {
        let view = UINib(nibName: "UpdateNotesView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UpdateNotesView
        return view
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        translatesAutoresizingMaskIntoConstraints = false
        notesTextView.translatesAutoresizingMaskIntoConstraints = false
        notesTextView.bounds = frame.inset(by: edgeInsets)
        
        NSLayoutConstraint.activate([
            notesTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            notesTextView.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: notesTextView.trailingAnchor),
            bottomAnchor.constraint(equalTo: notesTextView.bottomAnchor)
        ])
    }
}

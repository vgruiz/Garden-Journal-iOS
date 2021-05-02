//
//  UpdateImageView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/15/21.
//

import UIKit

class UpdateImageView: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet var label: UILabel!
    
    let viewHeight: CGFloat = 235
    
    class func instanceFromNib() -> UpdateImageView {
        let view = UINib(nibName: "UpdateImageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UpdateImageView
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            self.containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 10),
            self.containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 10),
            
            label.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor)
        ])
        
    }
}

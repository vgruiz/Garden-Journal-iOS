//
//  UpdateStatusView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 5/1/21.
//

import UIKit

class UpdateStatusView: UIView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    class func instanceFromNib() -> UpdateStatusView {
        let view = UINib(nibName: "UpdateStatusView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UpdateStatusView
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //MARK: Title Label
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            //MARK: Dummy Button
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
}

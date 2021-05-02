//
//  UpdateDate.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 5/1/21.
//

import UIKit

class UpdateDateView: UIView {

    @IBOutlet var dateTextField: UITextField!
    
    
    class func instanceFromNib() -> UpdateDateView {
        let view = UINib(nibName: "UpdateDateView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UpdateDateView
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
//            dateTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            self.trailingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 8),
            dateTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            dateTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
            self.bottomAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

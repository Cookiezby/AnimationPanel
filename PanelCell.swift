//
//  PanelCell.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/27.
//

import Foundation
import UIKit

let gray = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1.0)

@available(iOS 10.0, *)
class PanelCell: UITableViewCell {
    private var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "TimeInterval"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = gray
        return label
    }()
    
    private var rightLabel: UILabel = {
        let label = UILabel()
        label.text = "300ms"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(leftLabel)
        addSubview(rightLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        leftLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        leftLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        rightLabel.firstBaselineAnchor.constraint(equalTo: leftLabel.lastBaselineAnchor, constant: 0).isActive = true
        rightLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        rightLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

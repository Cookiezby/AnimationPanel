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
class AnimationTableCell: UITableViewCell {
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


@available(iOS 10.0, *)
class PanelAnimationOptionsCell: UITableViewCell {
    
    
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AnimationOptions"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = gray
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 10.0, *)
extension PanelAnimationOptionsCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
}

struct PanelAnimationOption {
    var option: UIView.AnimationOptions
    var description: String
    var enable: Bool
    init(option: UIView.AnimationOptions, description: String) {
        self.option = option
        self.description = description
        self.enable = false
    }
}

let options: [PanelAnimationOption] = [
    PanelAnimationOption(option: .layoutSubviews, description: "layoutSubview"),
    PanelAnimationOption(option: .allowUserInteraction, description: "allowUserInteraction"),
    PanelAnimationOption(option: .beginFromCurrentState, description: "beginFromCurrentState"),
    PanelAnimationOption(option: .`repeat`, description: "`repeat`"),
    PanelAnimationOption(option: .autoreverse, description: "autoreverse"),
    PanelAnimationOption(option: .overrideInheritedDuration, description: "overrideInheriteDuration"),
    PanelAnimationOption(option: .overrideInheritedCurve, description: "overrideInheritedCurve"),
    PanelAnimationOption(option: .allowAnimatedContent, description: "allowAnimatedContent"),
    PanelAnimationOption(option: .showHideTransitionViews, description: "showHideTransitionViews"),
    PanelAnimationOption(option: .overrideInheritedOptions, description: "overrideInheritedOptions"),
    PanelAnimationOption(option: .curveEaseInOut, description: "curveEaseInout"),
    PanelAnimationOption(option: .curveEaseIn, description: "curveEaseIn"),
    PanelAnimationOption(option: .curveEaseInOut, description: "curveEaseInOut"),
    PanelAnimationOption(option: .curveEaseOut, description: "curveEaseOut"),
    PanelAnimationOption(option: .curveLinear, description: "curveLinear"),
    PanelAnimationOption(option: .transitionFlipFromLeft, description: "transitionFlipFromLeft"),
    PanelAnimationOption(option: .transitionFlipFromRight, description: "transitionFlipFromRight"),
    PanelAnimationOption(option: .transitionCurlUp, description: "transitionCurUp"),
    PanelAnimationOption(option: .transitionCurlDown, description: "transitionCurDown"),
    PanelAnimationOption(option: .transitionCrossDissolve, description: "transitionCrossDissolve"),
    PanelAnimationOption(option: .transitionFlipFromTop, description: "transitionFlipFromTop"),
    PanelAnimationOption(option: .transitionFlipFromBottom, description: "transitionFlipFromBottom"),
    PanelAnimationOption(option: .preferredFramesPerSecond60, description: "preferredFramesPerSecond60"),
    PanelAnimationOption(option: .preferredFramesPerSecond30, description: "preferredFramesPerSecond30")
]

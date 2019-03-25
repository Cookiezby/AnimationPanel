//
//  PanelView.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/25.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
public class AnimationPanelView: UIView {
    
    public static let shared = AnimationPanelView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2 / 3))
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Menu", for: .normal)
        button.addTarget(self, action: #selector(showAnimationList), for: .touchUpInside)
        return button
    }()
    
    private let mainView = UIView()
    private let animationListView = UIView()
    
    private lazy var parameterListView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.register(AnimationTableCell.self, forCellReuseIdentifier: AnimationTableCell.description())
        view.tableFooterView = UIView()
        return view
    }()
    
    public override var isHidden: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                let dx: CGFloat = self.isHidden ? -self.bounds.width : self.bounds.width
                self.frame = self.frame.offsetBy(dx: dx, dy: 0)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowRadius = 3.5
        addSubview(mainView)
        addSubview(animationListView)
        mainView.addSubview(parameterListView)
        mainView.addSubview(menuButton)
        backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        parameterListView.translatesAutoresizingMaskIntoConstraints = false
        parameterListView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40).isActive = true
        parameterListView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        parameterListView.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        parameterListView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        menuButton.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        mainView.frame = bounds
        animationListView.frame = CGRect(x: -200, y: 0, width: 200, height: bounds.height)
    }
    
    @objc private func showAnimationList() {
        UIView.animate(withDuration: 0.3) {
            self.mainView.frame = self.mainView.frame.offsetBy(dx: 200, dy: 0)
            self.animationListView.frame = self.animationListView.frame.offsetBy(dx: 200, dy: 0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 10.0, *)
extension AnimationPanelView: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimationTableCell.description(), for: indexPath)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
    }
}


@available(iOS 10.0, *)
extension AnimationPanelView {
    public static func setupIn(view: UIView) {
        view.addSubview(AnimationPanelView.shared)
    }
}

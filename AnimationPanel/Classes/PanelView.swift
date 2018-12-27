//
//  PanelView.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/25.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
public class PanelView: UIView {
    
    public static let shared = PanelView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2 / 3))
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.register(PanelCell.self, forCellReuseIdentifier: PanelCell.description())
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
        addSubview(tableView)
        backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 10.0, *)
extension PanelView: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PanelCell.description(), for: indexPath)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

@available(iOS 10.0, *)
extension PanelView {
    public class func setup() {
        PanelView.shared.layer.zPosition = CGFloat(MAXFLOAT)
        UIApplication.shared.windows.last?.addSubview(PanelView.shared)
    }
}

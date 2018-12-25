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
    
    public static let shared = PanelView(frame: CGRect(x: 0, y: 0, width: 150, height: UIScreen.main.bounds.height))
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .black
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        backgroundColor = .red
        setupConstraints()
    }

    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: self.topAnchor)
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor)
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

@available(iOS 10.0, *)
extension PanelView {
    public class func setup() {
        PanelView.shared.layer.zPosition = CGFloat(MAXFLOAT)
        UIApplication.shared.windows.last?.addSubview(PanelView.shared)
    }
}

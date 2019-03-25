//
//  PanelAnimationListView.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2019/02/15.
//

import UIKit

class AnimationListView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableFooterView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnimationListView: UITableViewDelegate, UITableViewDataSource {
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        return cell
    }
}

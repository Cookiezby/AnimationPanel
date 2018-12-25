//
//  PanelView.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/25.
//

import Foundation
import UIKit

public class PanelView: UIView {
    private let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        alpha = 0.8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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

//
//  NameAndColorCell.swift
//  08Table Cells
//
//  Created by 万畅 on 15/8/26.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
//    var name: String = ""
//    var color: String = ""
    var nameLabel: UILabel!
    var colorLabel: UILabel!
    
    var name: String = "" {
        didSet {
        if (name != oldValue) {
        nameLabel.text = name
        } }
    }
    var color: String = "" {
        didSet {
        if (color != oldValue) {
        colorLabel.text = color
        }
        } }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRectMake(0, 5, 70, 15)
        let nameMarker = UILabel(frame: nameLabelRect)
        nameMarker.textAlignment = NSTextAlignment.Right
        nameMarker.text = "Name:"
        nameMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(nameMarker)
        let colorLabelRect = CGRectMake(0, 26, 70, 15)
        let colorMarker = UILabel(frame: colorLabelRect)
        colorMarker.textAlignment = NSTextAlignment.Right
        colorMarker.text = "Color:"
        colorMarker.font = UIFont.boldSystemFontOfSize(12)
        contentView.addSubview(colorMarker)
        let nameValueRect = CGRectMake(80, 5, 200, 15)
        nameLabel = UILabel(frame: nameValueRect)
        contentView.addSubview(nameLabel)
        let colorValueRect = CGRectMake(80, 25, 200, 15)
        colorLabel = UILabel(frame: colorValueRect)
        contentView.addSubview(colorLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}

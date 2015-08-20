//
//  TodoViewCell.swift
//  3TodoList
//
//  Created by 万畅 on 15/8/19.
//  Copyright (c) 2015年 abelwan. All rights reserved.
//
import UIKit
import Foundation
import Cartography
import FontAwesomeKit
import MGSwipeTableCell

class TodoViewCell: MGSwipeTableCell
{
    private let subtitle = UILabel()
    private let title = UILabel()
    private let checkMark = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
}

private extension TodoViewCell{
    func setup(){
        
    }
}

private extension TodoViewCell{
    func layoutView(){
        
    }
}

private extension TodoViewCell{
    func style(){
        
    }
}


// MARK: render
extension TodoViewCell{
    private func checkmarkAttributedStringTodo(todo: Todo) -> NSAttributedString{
        if (todo.done ) {
            return FAKFontAwesome.checkSquareOIconWithSize(20).attributedString()
        } else {
            return FAKFontAwesome.squareOIconWithSize(20).attributedString()
        }
    }
    
    func render(todo: Todo){
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd-MM-YY"
        let dueDate = dateFormatter.stringFromDate(todo.dueDate)
        
        subtitle.text = "\(dueDate) | \(todo.list)"
        title.text = todo.description
        
        checkMark.attributedText = checkmarkAttributedStringTodo(todo)
    }
}

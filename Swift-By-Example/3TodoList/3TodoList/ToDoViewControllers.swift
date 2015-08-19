//
//  ToDoViewControllers.swift
//  3TodoList
//
//  Created by 万畅 on 15/8/18.
//  Copyright © 2015年 abelwan. All rights reserved.
//
import UIKit
import Cartography
import MGSwipeTableCell


class ToDoViewControllers: UIViewController {

    private let tableView = UITableView()
    private let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
        
    }
}

private extension ToDoViewControllers{
    func setup(){
        title = "Todos"
        view.backgroundColor = UIColor.grayColor()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
//        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.addSubview(tableView)
        
        addButton.addTarget(self, action: "addTodoButtonPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(addButton)

    }
    
    
    
}

// mark: layout
private extension ToDoViewControllers{
    func layoutView(){
        layout(tableView) { view in
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
            view.left == view.superview!.left
            view.right == view.superview!.right
        }
        layout(addButton) { view in
            view.bottom == view.superview!.bottom - 5
            view.centerX == view.superview!.centerX
            view.width == view.height
            view.height == 60
        }

        
    }
    
    
    
}

private extension ToDoViewControllers{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
        
    }
    
}

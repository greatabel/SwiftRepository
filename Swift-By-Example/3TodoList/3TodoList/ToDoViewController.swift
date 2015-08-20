//
//  ToDoViewController.swift
//  3TodoList
//
//  Created by 万畅 on 15/8/18.
//  Copyright © 2015年 abelwan. All rights reserved.
//
import UIKit
import Cartography
import MGSwipeTableCell


class ToDoViewController: UIViewController {

    private let tableView = UITableView()
    private let addButton = UIButton()
    
    private let todosDatastore: TodosDatastore
    private var todos: Array<Todo>
    
    private init(){
        fatalError("init() must not called")

    }
    
    required init(todosDatastore: TodosDatastore) {
        self.todosDatastore = todosDatastore
        self.todos = todosDatastore.todos()
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
        
    }
}

private extension ToDoViewController{
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
private extension ToDoViewController{
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

private extension ToDoViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
        
    }
    
}

extension ToDoViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TodoViewCell
        
         return cell
    }

}

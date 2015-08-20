//
//  EditTodoViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 06/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Cartography
import FontAwesomeKit

class EditTodoViewController: UIViewController {
    private let descriptionTextField = UITextField()
    private let descriptionSeparator = UIView()
    private let listNameLabel = UILabel()
    private let listButton = UIButton()
    private let listSeparator = UIView()
    
    private let dueDateLabel = UILabel()
    private let dueDateButton = UIButton()
    private let dueDateSeparator = UIView()
    
    private let doneButton = UIButton()
    
    private let dueDatePicker = UIDatePicker()
    
    private let todosDatastore: TodosDatastore
    private let todoToEdit: Todo?
    private var list: List
    private var dueDate: NSDate
    
    private init() {
        fatalError("init() must not called")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(todosDatastore: TodosDatastore, todoToEdit: Todo?) {
        self.todosDatastore = todosDatastore
        self.todoToEdit = todoToEdit
        if let todo = self.todoToEdit {
            descriptionTextField.text = todo.description
            list = todo.list
            dueDate = todo.dueDate
        } else {
            list = self.todosDatastore.defaultList()
            dueDate = self.todosDatastore.defaultDueDate()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
    }
}


// MARK: Setup
private extension EditTodoViewController{
    func setup(){
        func descriptionSetup() {
            descriptionTextField.placeholder = "Description of Todo"
            descriptionTextField.becomeFirstResponder()
            view.addSubview(descriptionTextField)
            view.addSubview(descriptionSeparator)
        }
        
        func listSetup() {
            view.addSubview(listNameLabel)
            listButton.setAttributedTitle(FAKFontAwesome.listIconWithSize(20).attributedString(), forState: .Normal)
            listButton.addTarget(self, action: "listButtonPressed:", forControlEvents: .TouchUpInside)
            view.addSubview(listButton)
            view.addSubview(listSeparator)
        }
        
        func dueDateSetup() {
            view.addSubview(dueDateLabel)
            dueDateButton.setAttributedTitle(FAKFontAwesome.clockOIconWithSize(20).attributedString(), forState: .Normal)
            dueDateButton.addTarget(self, action: "dueDateButtonPressed:", forControlEvents: .TouchUpInside)
            view.addSubview(dueDateButton)
            view.addSubview(dueDateSeparator)
        }
        
        func doneSetup() {
            doneButton.setAttributedTitle(FAKFontAwesome.checkIconWithSize(80).attributedString(), forState: .Normal)
            doneButton.addTarget(self, action: "doneButtonPressed:", forControlEvents: .TouchUpInside)
            view.addSubview(doneButton)
        }
        
        func datePickerSetup() {
            dueDatePicker.datePickerMode = .DateAndTime
            dueDatePicker.minimumDate = NSDate()
            dueDatePicker.date = dueDate
            dueDatePicker.addTarget(self, action: "dueDateChanged:", forControlEvents: .ValueChanged)
            view.addSubview(dueDatePicker)
        }
        
        descriptionSetup()
        listSetup()
        dueDateSetup()
        doneSetup()
        datePickerSetup()
        refresh()
    }
    
    func refresh() {
        listNameLabel.text = "List: \(list.description)"
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd-MM-YY"
        let formattedDueDate = dateFormatter.stringFromDate(dueDate)
        dueDateLabel.text = "Due date: \(formattedDueDate)"
    }
}

// MARK: Layout
private extension EditTodoViewController{
    func layoutView(){
        func descriptionLayout() {
            layout(descriptionTextField) { view in
                view.top == view.superview!.top + 70
                view.left == view.superview!.left + 10
                view.right == view.superview!.right - 10
                view.height == 50
            }
            
            layout(descriptionSeparator, descriptionTextField) {view, view2 in
                view.left == view.superview!.left
                view.right == view.superview!.right
                view.top == view2.bottom
                view.height == 1
            }
        }
        
        func listLayout() {
            layout(listNameLabel, descriptionSeparator) {view, view2 in
                view.top == view2.bottom
                return
            }
            
            layout(listNameLabel, descriptionTextField) {view, view2 in
                view.left == view2.left
                view.height == view2.height
            }
            
            layout(listNameLabel, listButton) {view, view2 in
                view.right == view2.left
                view.top == view2.top
                view.height == view2.height
                view2.height == view2.width
                view2.right == view2.superview!.right
            }
            
            layout(listSeparator, listNameLabel) {view, view2 in
                view.left == view.superview!.left
                view.right == view.superview!.right
                view.top == view2.bottom
                view.height == 1
            }
        }
        
        func dueDateLayout() {
            layout(dueDateLabel, listSeparator) {view, view2 in
                view.top == view2.bottom
                return
            }
            
            layout(dueDateLabel, listNameLabel) {view, view2 in
                view.left == view2.left
                view.height == view2.height
            }
            
            layout(dueDateLabel, dueDateButton) {view, view2 in
                view.right == view2.left
                view.top == view2.top
                view.height == view2.height
                view2.height == view2.width
                view2.right == view2.superview!.right
            }
            
            layout(dueDateSeparator, dueDateLabel) {view, view2 in
                view.left == view.superview!.left
                view.right == view.superview!.right
                view.top == view2.bottom
                view.height == 1
            }
        }
        
        func doneLayout() {
            layout(doneButton, dueDateSeparator) {view, view2 in
                view.top == view2.bottom + 20
                view.centerX == view.superview!.centerX
                view.height == view.width
                view.width == 100
            }
        }
        
        func datePickerLayout() {
            layout(dueDatePicker) {view in
                view.left == view.superview!.left
                view.right == view.superview!.right
                view.bottom == view.superview!.bottom
            }
        }
        
        descriptionLayout()
        listLayout()
        dueDateLayout()
        doneLayout()
        datePickerLayout()
        
    }
}

// MARK: Style
private extension EditTodoViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        descriptionTextField.font = UIFont.latoLightFontOfSize(20)
        descriptionTextField.backgroundColor = UIColor.whiteColor()
        descriptionSeparator.backgroundColor = UIColor.separatorColor()
        
        listNameLabel.font = UIFont.latoFontOfSize(16)
        listNameLabel.backgroundColor = UIColor.whiteColor()
        listSeparator.backgroundColor = UIColor.separatorColor()
        
        dueDateLabel.font = UIFont.latoFontOfSize(16)
        dueDateLabel.backgroundColor = UIColor.whiteColor()
        dueDateSeparator.backgroundColor = UIColor.separatorColor()
    }
}

// MARK: Actions
extension EditTodoViewController {
    func listButtonPressed(sender: UIButton!){
//        let listsVC = ListsViewController(todosDatastore: todosDatastore) { list in
//            self.list = list
//            self.refresh()
//        }
//        navigationController!.pushViewController(listsVC, animated: true)
    }
    
    func dueDateButtonPressed(sender: UIButton!) {
        descriptionTextField.resignFirstResponder()
    }
    
    func doneButtonPressed(sender: UIButton!) {
        if !descriptionTextField.text!.isEmpty {
            let newTodo = Todo(description: descriptionTextField.text!,
                list: list,
                dueDate: dueDate,
                done: false,
                doneDate: nil)
            todosDatastore.addTodo(newTodo)
            todosDatastore.deleteTodo(todoToEdit)
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    func dueDateChanged(sender: UIButton!) {
        dueDate = dueDatePicker.date
        refresh()
    }
    
}

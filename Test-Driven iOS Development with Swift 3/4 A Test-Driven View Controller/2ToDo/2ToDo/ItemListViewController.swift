//
//  ItemListViewController.swift
//  2ToDo
//
//  Created by 万畅 on 2017/9/29.
//  Copyright © 2017年 luminagic. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {



    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: ItemListDataProvider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        tableView = UITableView()
        tableView.dataSource = dataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

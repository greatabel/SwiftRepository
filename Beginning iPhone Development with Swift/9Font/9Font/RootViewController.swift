//
//  RootViewController.swift
//  9Font
//
//  Created by 万畅 on 15/8/26.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    private var favoritesList: FavoritesList!
    private let familyCell = "FamilyName"
    private let favoritesCell = "Favorites"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyNames =  UIFont.familyNames().sort() as [String]
        let preferredTableViewFont =
        UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredTableViewFont.pointSize
        favoritesList = FavoritesList.sharedFavoriteList
    }

}

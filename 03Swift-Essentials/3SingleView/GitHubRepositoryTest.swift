//
//  GitHubRepositoryTest.swift
//  3SingleView
//
//  Created by abel on 15/7/17.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import XCTest

class GitHubRepositoryTest:XCTestCase {
    func testRepository(){
        var repo = GithubRepository()
        repo.id = 1
        repo.name = "Abel"
       
        XCTAssertEqual(repo.detailsURL(),"https://api.github.com/repositories/1","repository details")
    }
}

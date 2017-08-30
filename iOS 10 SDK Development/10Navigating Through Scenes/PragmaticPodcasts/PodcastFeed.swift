//
//  PodcastFeed.swift
//  PragmaticPodcasts
//
//  Created by Chris Adamson on 9/18/16.
//  Copyright © 2016 Pragmatic Programmers, LLC. All rights reserved.
//

import Foundation

struct PodcastFeed {
  
  var title : String?
  var link : URL?
  var description : String?
  var iTunesAuthor : String?
  var iTunesImageURL : URL?

  var episodes : [PodcastEpisode] = []
  
}

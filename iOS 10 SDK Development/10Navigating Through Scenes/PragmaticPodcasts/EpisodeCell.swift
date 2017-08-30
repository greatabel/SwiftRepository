//
//  EpisodeCell.swift
//  PragmaticPodcasts
//
//  Created by Chris Adamson on 10/8/16.
//  Copyright © 2016 Pragmatic Programmers, LLC. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

  @IBOutlet var artworkImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var durationLabel: UILabel!

  var loadingImageURL : URL?
}

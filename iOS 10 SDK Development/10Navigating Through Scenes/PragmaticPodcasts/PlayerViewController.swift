import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
  
  var player : AVPlayer?
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var playPauseButton: UIButton!
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var logoView: UIImageView!
  private var playerPeriodicObserver : Any?
  
  deinit {
    player?.removeObserver(self, forKeyPath: "rate")
    if let oldObserver = playerPeriodicObserver {
      player?.removeTimeObserver(oldObserver)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let url = URL(string: "http://traffic.libsyn.com/cocoaconf/CocoaConf001.m4a") {
      set(url: url)
    }
  }
  
  @IBAction func handlePlayPauseTapped(_ sender: Any) {
    if let player = player {
      if player.rate == 0 {
        player.play()
      } else {
        player.pause()
      }
    }
  }

  func set(url: URL) {
    if let oldObserver = playerPeriodicObserver {
      player?.removeTimeObserver(oldObserver)
    }
    player = AVPlayer(url: url)
    titleLabel.text = url.lastPathComponent
    player?.addObserver(self,
                        forKeyPath: "rate",
                        options: [],
                        context: nil)
    let interval = CMTime(seconds: 0.5, preferredTimescale: 1000)
    playerPeriodicObserver =
      player?.addPeriodicTimeObserver(forInterval: interval,
                                      queue: nil)
      { [weak self] currentTime in
        self?.updateTimeLabel(currentTime)
    }
  }
  
  private func updateTimeLabel(_ currentTime: CMTime) {
    let totalSeconds = currentTime.seconds
    let minutes = Int(totalSeconds / 60)
    let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
    let secondsString = seconds >= 10 ? "\(seconds)" : "0\(seconds)"
    timeLabel.text = "\(minutes):\(secondsString)"
  }
  
  // MARK: - KVO
  override func observeValue(forKeyPath keyPath: String?,
                             of object: Any?,
                             change: [NSKeyValueChangeKey : Any]?,
                             context: UnsafeMutableRawPointer?) {
    if keyPath == "rate",
      let player = object as? AVPlayer {
      playPauseButton.setTitle(player.rate == 0 ? "Play" : "Pause",
                               for: .normal)
    }
  }
}

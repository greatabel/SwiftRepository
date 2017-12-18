import UIKit
import SnapKit

public enum FollowButtonState {
    case NotFollowing
    case Following
    case Loading
}

public protocol FollowButtonDelegate: class {
    func didPressFollowButton(currentState: FollowButtonState)
}

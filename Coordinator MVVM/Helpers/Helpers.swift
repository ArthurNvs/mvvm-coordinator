import Foundation
import UIKit

public func showAlertMessage(title: String, message: String, action: String, _ view: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: action, style: .default, handler: nil))
    view.present(alertController, animated: true, completion: nil)
}

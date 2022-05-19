import Foundation
import UIKit

extension UIViewController {
    public func showAlertMessage(title: String, message: String, action: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: action, style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

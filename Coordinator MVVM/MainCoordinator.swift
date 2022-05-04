import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOcurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var viewController: UIViewController & Coordinating = ScreenCViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = ScreenAViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: false)
    }
}

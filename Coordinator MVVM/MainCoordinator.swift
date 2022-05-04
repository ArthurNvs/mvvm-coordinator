import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOcurred(with type: Event) {
        switch type {
        case .directToA: directToScreen(ScreenAViewController())
        case .directToB: directToScreen(ScreenBViewController())
        case .directToC: directToScreen(ScreenCViewController())
        }
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = ScreenAViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    func directToScreen(_ viewController: UIViewController & Coordinating) {
        var viewController: UIViewController & Coordinating = viewController
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

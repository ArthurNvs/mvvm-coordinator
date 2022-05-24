import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childrens: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushTo(viewController: makeAViewController(coordinator: self))
    }
    
    func navigateTo(screen: Screen, model: Any?) {
        switch screen {
        case .A: pushTo(viewController: makeAViewController(coordinator: self))
        case .B: pushTo(viewController: makeBViewController(coordinator: self, aModel: model as! AModel))
        case .C: pushTo(viewController: makeCViewController(coordinator: self, bModel: model as! BModel))
        }
    }
    
    
    func pushTo(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}

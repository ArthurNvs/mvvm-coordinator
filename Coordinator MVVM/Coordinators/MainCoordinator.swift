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
    
    func navigateTo(screen: Screen) {
        switch screen {
        case .A: pushTo(viewController: makeAViewController(coordinator: self))
        case let .B(aModel): pushTo(viewController: makeBViewController(coordinator: self, aModel: aModel))
        case let .C(bModel): pushTo(viewController: makeCViewController(coordinator: self, bModel: bModel))
        }
    }
    
    func pushTo(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}

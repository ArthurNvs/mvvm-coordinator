import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childrens: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(HomeViewController(viewModel: HomeViewModel(coordinator: self)), animated: true)
    }
    
    func navigateTo(screen: Screen) {
        switch screen {
        case .A: openModal(viewController: makeAViewController(coordinator: self))
        case let .B(aModel): openModal(viewController: makeBViewController(coordinator: self, aModel: aModel))
        case let .C(bModel): openModal(viewController: makeCViewController(coordinator: self, bModel: bModel))
        }
    }
    
    func openModal(viewController: UIViewController) {
        dismissModal()
        navigationController.present(viewController, animated: true)
    }
    
    func dismissModal() {
        navigationController.dismiss(animated: true)
    }
}

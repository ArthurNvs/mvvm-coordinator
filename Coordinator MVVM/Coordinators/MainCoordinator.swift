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
        case .A: openModal(viewController: makeHomeViewController(coordinator: self))
        case let .B(homeModel): openModal(viewController: makeBirthDayViewController(coordinator: self, homeModel: homeModel))
        case let .C(birthDayModel): openModal(viewController: makePersonInfoViewController(coordinator: self, birthDayModel: birthDayModel))
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

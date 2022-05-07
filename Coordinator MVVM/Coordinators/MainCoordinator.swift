import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToA()
    }
    
    func goToA() {
        let screenAViewModel = ScreenAViewModel.init()
        screenAViewModel.coordinator = self
        let screenAViewController = ScreenAViewController(viewModel: screenAViewModel)
        navigationController.pushViewController(screenAViewController, animated: true)
    }
    
    func goToB() {
        let screenBViewModel = ScreenBViewModel.init()
        screenBViewModel.coordinator = self
        let screenBViewController = ScreenBViewController(viewModel: screenBViewModel)
        navigationController.pushViewController(screenBViewController, animated: true)
    }
    
    func goToC() {
        let screenCViewModel = ScreenCViewModel.init()
        screenCViewModel.coordinator = self
        let screenCViewController = ScreenCViewController(viewModel: screenCViewModel)
        navigationController.pushViewController(screenCViewController, animated: true)
    }
    
}

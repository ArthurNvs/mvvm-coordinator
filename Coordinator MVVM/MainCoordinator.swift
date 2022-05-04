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
        let screenAViewController = ScreenAViewController()
        let screenAViewModel = ScreenAViewModel.init()
        
        screenAViewModel.coordinator = self
        screenAViewController.viewModel = screenAViewModel
        
        navigationController.pushViewController(screenAViewController, animated: true)
    }
    
    func goToB() {
        let screenBViewController = ScreenBViewController()
        let screenBViewModel = ScreenBViewModel.init()
        
        screenBViewModel.coordinator = self
        screenBViewController.viewModel = screenBViewModel
        
        navigationController.pushViewController(screenBViewController, animated: true)
    }
    
    func goToC() {
        let screenCViewController = ScreenCViewController()
        let screenCViewModel = ScreenCViewModel.init()
        
        screenCViewModel.coordinator = self
        screenCViewController.viewModel = screenCViewModel
        
        navigationController.pushViewController(screenCViewController, animated: true)
    }
    
}

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childrens: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToA()
    }
    
    func goToA() {
        let screenAViewModel = AViewModel(coordinator: self)
        let screenAViewController = AViewController(viewModel: screenAViewModel)
        navigationController.pushViewController(screenAViewController, animated: true)
    }
    
    func goToB(_ aModel: AModel) {
        let screenBViewModel = BViewModel(coordinator: self)
        let screenBViewController = BViewController(viewModel: screenBViewModel, aModel: aModel)
        navigationController.pushViewController(screenBViewController, animated: true)
    }
    
    func goToC() {
        let screenCViewModel = CViewModel(coordinator: self)
        let screenCViewController = CViewController(viewModel: screenCViewModel)
        navigationController.pushViewController(screenCViewController, animated: true)
    }
    
}

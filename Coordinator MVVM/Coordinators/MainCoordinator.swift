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
        navigationController.pushViewController(makeAViewController(coordinator: self), animated: true)
    }
    
    func goToB(_ aModel: AModel) {
        navigationController.pushViewController(makeBViewController(coordinator: self, aModel: aModel), animated: true)
    }
    
    func goToC(_ bModel: BModel) {
        navigationController.pushViewController(makeCViewController(coordinator: self, bModel: bModel), animated: true)
    }
}

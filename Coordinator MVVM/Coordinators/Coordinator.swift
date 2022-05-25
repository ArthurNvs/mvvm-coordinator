import Foundation
import UIKit

enum Screen {
    case A
    case B(HomeModel)
    case C(BModel)
}

protocol Coordinator {
    var childrens: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func navigateTo(screen: Screen)
    func openModal(viewController: UIViewController)
}

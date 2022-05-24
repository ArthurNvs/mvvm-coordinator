import Foundation
import UIKit

enum Screen {
    case A
    case B(AModel)
    case C(BModel)
}

protocol Coordinator {
    var childrens: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func navigateTo(screen: Screen)
    func pushTo(viewController: UIViewController)
}

import Foundation
import UIKit

enum Screen {
    case A
    case B
    case C
}

protocol Coordinator {
    var childrens: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func navigateTo(screen: Screen, model: Any?)
    func pushTo(viewController: UIViewController)
}

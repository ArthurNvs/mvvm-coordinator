import Foundation
import UIKit

protocol Coordinator {
    var childrens: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

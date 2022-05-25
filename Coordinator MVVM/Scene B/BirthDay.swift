import Foundation

protocol BirthDay {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction(fullName: String, birthDay: String)
}

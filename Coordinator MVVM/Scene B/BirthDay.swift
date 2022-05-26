import Foundation

protocol BirthDay {
    var coordinator: Coordinator { get set }
    
    func didButtonTapAction(fullName: String, birthDay: String)
}

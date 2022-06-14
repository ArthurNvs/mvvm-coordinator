import Foundation

protocol Home {
    var coordinator: Coordinator { get set }
    
    func didButtonTapAction(firstName: String, lastName: String)
}

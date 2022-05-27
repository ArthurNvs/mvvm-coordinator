import Foundation

protocol HomeView {
    var coordinator: Coordinator { get set }
    
    func didButtonTapAction(firstName: String, lastName: String)
}

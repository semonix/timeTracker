//import UIKit

protocol EditViewProtocol: AnyObject {
    // Что Presenter может вызвать во View
}
protocol EditInteractorProtocol {
    // Что Presenter может вызвать в Interactor
}
protocol EditRouterProtocol {
    // Что Presenter может вызвать для навигации
}

class EditPresenter {
    
    weak var view: EditViewProtocol?
    var interactor: EditInteractorProtocol!
    var router: EditRouterProtocol!
    
    init(view: EditViewProtocol, interactor: EditInteractorProtocol, router: EditRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension EditPresenter: EditPresenterProtocol {
    // Что View вызывает в Presenter
}
extension EditPresenter: EditInteractorOutput {
    // Что Interactor вызывает в Presenter
}

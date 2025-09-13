import Foundation

protocol EditInteractorOutput: AnyObject {
    // Что Interactor вызывает в Presenter
}

class EditInteractor {
    weak var interactorOutput: EditInteractorOutput?
}

extension EditInteractor: EditInteractorProtocol {
    // Что Presenter может вызвать в Interactor
}

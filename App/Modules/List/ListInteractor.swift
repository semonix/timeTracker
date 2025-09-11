import Foundation

protocol ListInteractorOutput: AnyObject {
    //  Что Interactor вызывает в Presenter
}

class ListInteractor {
    weak var interactorOutput: ListInteractorOutput?
}

extension ListInteractor: ListInteractorProtocol {
    //  Что Presenter может вызвать в Interactor
}

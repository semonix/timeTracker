import Foundation

protocol DetailInteractorOutput: AnyObject {
    //  Что Interactor вызывает в Presenter
}

class DetailInteractor {
    weak var interactorOutput: DetailInteractorOutput?
}

extension DetailInteractor: DetailInteractorProtocol {
    //  Что Presenter может вызвать в Interactor
}

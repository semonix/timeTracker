import Foundation

protocol InteractorOutput: AnyObject {
    //  Что Interactor вызывает в Presenter
}

class DetailInteractor {
    weak var interactorOutput: InteractorOutput?
}

extension DetailInteractor: InteractorProtocol {
    //  Что Presenter может вызвать в Interactor
}

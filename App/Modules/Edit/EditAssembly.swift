import UIKit

class EditAssembly {
    static func createModule() -> UIViewController {
        let view = EditViewController()
        let interactor = EditInteractor()
        let router = EditRouter()
        let presenter = EditPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.interactorOutput = presenter
        router.view = view
        
        return view
    }
}

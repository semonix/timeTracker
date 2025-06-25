import UIKit

class DetailAssembly {
    static func createModule() -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.interactorOutput = presenter
        router.view = view
        
        return view
    }
}

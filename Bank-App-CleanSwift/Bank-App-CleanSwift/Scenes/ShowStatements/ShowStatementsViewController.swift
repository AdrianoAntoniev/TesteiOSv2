//
//  ShowStatementsViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

protocol ShowStatementsLogic: class {
    func displayUserAccountInfo(viewModel: ShowStatements.UserAccountDescription.ViewModel)
    func populateTableView(viewModel: ShowStatements.ShowStatements.ViewModel)
}


class ShowStatementsViewController: UIViewController, ShowStatementsLogic {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
        
    var interactor: (ShowStatementsBusinessLogic & ShowStatementsDataStore)?
    var router: (NSObjectProtocol & ShowStatementsRoutingLogic & ShowStatementsDataPassing)?
    
    @IBAction func exitButtonPressed(_ button: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
        
        let userDescriptionRequest = ShowStatements.UserAccountDescription.Request(userAccount: interactor?.userAccount)
        interactor?.showUserAccountData(request: userDescriptionRequest)
            
        if let userId = interactor?.userAccount.userId {
            let showStatementsRequest = ShowStatements.ShowStatements.Request(userId: userId)
            interactor?.showStatements(request: showStatementsRequest)
        }        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupCleanSwiftObjects()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupCleanSwiftObjects()
    }
    
    private func setupCleanSwiftObjects() {
        let viewController = self
        let interactor = ShowStatementsInteractor()
        let presenter = ShowStatementsPresenter()
        let router = ShowStatementsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
        
    
    func displayUserAccountInfo(viewModel: ShowStatements.UserAccountDescription.ViewModel) {        
        self.userNameLabel.text = viewModel.fields.name
        self.userAccountLabel.text = viewModel.fields.accountWithAgency
        self.balanceLabel.text = viewModel.fields.balance
    }
    
    func populateTableView(viewModel: ShowStatements.ShowStatements.ViewModel) {
        
    }
}



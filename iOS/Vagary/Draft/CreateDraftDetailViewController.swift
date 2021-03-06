//
//  CreateDraftDetailViewController.swift
//  Vagary
//
//  Created by Jonathan Witten on 9/22/17.
//  Copyright © 2017 Jonathan Witten. All rights reserved.
//

import UIKit
import ReSwift

protocol CreateDraftDetailPresenter: Presenter {
    var handler: DraftHandler? { get set }
}

class CreateDraftDetailViewController: UIViewController, StoreSubscriber, CreateDraftDetailPresenter {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!

    var handler: DraftHandler?
    
    var field: DraftField?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = field {
            switch f {
            case .Location(let location):
                typeLabel.text = "Location"
                textField.text = location
            case .Title(let title):
                typeLabel.text = "Title"
                textField.text = title
            case .Trip(let trip):
                typeLabel.text = "Trip"
                textField.text = trip
            }
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done(_:)))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ViaStore.sharedStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ViaStore.sharedStore.unsubscribe(self)
    }
    
    static func build(handler: DraftHandler, field: DraftField) -> CreateDraftDetailViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateDraftDetailViewController") as! CreateDraftDetailViewController
        vc.handler = handler
        vc.field = field
        return vc
    }
    
    @objc func done(_ sender: UIBarButtonItem) {
        handler?.doneEditingDraftInfoDetail()
    }
    
    @IBAction func updateFieldDetail(_ sender: Any) {
        guard let f = field else {
            return
        }
        let newField: DraftField
        switch f {
        case .Location(_): newField = .Location(location: textField.text ?? "")
        case .Title(_): newField = .Title(title: textField.text ?? "")
        case .Trip(_): newField = .Trip(trip: textField.text ?? "")
        }
        handler?.updateDraftField(field: newField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newState(state: AppState) {
        //workingPost = state.authenticatedState?.draft.workingPost
        
    }

}

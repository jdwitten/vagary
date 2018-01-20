
//
//  FeedCoordinator.swift
//  Travel
//
//  Created by Jonathan Witten on 7/18/17.
//  Copyright © 2017 Jonathan Witten. All rights reserved.
//

import Foundation
import ReSwift
import PromiseKit


class FeedCoordinator: FeedHandler {
    var api = TravelApi()
    
    let dependencies: AppDependency
    let rootPresenter: NavigationPresenter
    
    init(dependencies: AppDependency){
        self.dependencies = dependencies
        rootPresenter = dependencies.factory.navigationPresenter()
        rootPresenter.push(presenter: dependencies.factory.feedPresenter(handler: self), animated: true)
    }
    
    func updatePosts() {
        let _ = firstly {
            dependencies.api.getPosts()
        }.then { response in
            ViaStore.sharedStore.dispatch(FeedAction.updatePosts(.loaded(data: response.posts)))
        }.catch{ error in
            ViaStore.sharedStore.dispatch(FeedAction.updatePosts(.error))
        }
    }
}

protocol FeedHandler {
    func updatePosts()
}



//
//  Factory.swift
//  Vagary
//
//  Created by Jonathan Witten on 1/7/18.
//  Copyright © 2018 Jonathan Witten. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

protocol PresenterFactory {
    func loginPresenter(handler: LoginHandler) -> LoginPresenter
    func feedPresenter(handler: FeedHandler) -> FeedPresenter
    func tabBarPresenter() -> TabBarPresenter
    func navigationPresenter() -> NavigationPresenter
    func rootPresenter() -> RootPresenter
    func passportPresenter(handler: PassportHandler) -> PassportPresenter
    func postOptionsPresenter(handler: DraftHandler) -> PostOptionsPresenter
    func createPostPresenter(handler: DraftHandler) -> CreatePostPresenter
    func createDraftDetailPresenter(handler: DraftHandler, field: DraftField) -> CreateDraftDetailPresenter
    func draftPostPresenter(handler: DraftHandler) -> DraftPostPresenter
    func draftListPresenter(handler: DraftHandler) -> DraftListPresenter
    func postDetailPresenter(handler: FeedHandler) -> PostDetailPresenter
    func imageSelectorPresenter(handler: ImageSelectorHandler) -> ImageSelectorPresenter
    func createTripPresenter(handler: CreateTripHandler) -> CreateTripPresenter
}

struct UIPresenterFactory: PresenterFactory {
    
    func loginPresenter(handler: LoginHandler) -> LoginPresenter {
        return LoginViewController.build(handler: handler)
    }
    
    func rootPresenter() -> RootPresenter {
        return UIRootPresenter()
    }
    func feedPresenter(handler: FeedHandler) -> FeedPresenter {
        return FeedViewController.build(handler: handler)
    }
    
    func tabBarPresenter() -> TabBarPresenter {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ControllerStoryboardId.RootTabBarController.rawValue) as! UITabBarController
    }
    
    func navigationPresenter() -> NavigationPresenter {
        return UINavigationController()
    }
    
    func passportPresenter(handler: PassportHandler) -> PassportPresenter {
        return PassportViewController.build(handler: handler)
    }
    
    func postOptionsPresenter(handler: DraftHandler) -> PostOptionsPresenter {
        return PostOptionsViewController.build(handler: handler)
    }
    
    func createPostPresenter(handler: DraftHandler) -> CreatePostPresenter {
        return CreatePostViewController.build(handler: handler)
    }
    
    func createDraftDetailPresenter(handler: DraftHandler, field: DraftField) -> CreateDraftDetailPresenter {
        return CreateDraftDetailViewController.build(handler: handler, field: field)
    }
    
    func draftPostPresenter(handler: DraftHandler) -> DraftPostPresenter {
        return DraftPostViewController.build(handler: handler)
    }
    
    func draftListPresenter(handler: DraftHandler) -> DraftListPresenter {
        return DraftListViewController.build(handler: handler)
    }
    
    func postDetailPresenter(handler: FeedHandler) -> PostDetailPresenter {
        return PostDetailViewController.build(handler: handler)
    }
    
    func imageSelectorPresenter(handler: ImageSelectorHandler) -> ImageSelectorPresenter {
        return ImageSelectorController.build(handler:handler)
    }
    
    func createTripPresenter(handler: CreateTripHandler) -> CreateTripPresenter {
        return CreateTripViewController.build(handler: handler)
    }
    
}

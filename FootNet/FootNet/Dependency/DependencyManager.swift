//
//  DependencyManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 03/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import Swinject

public class DependencyManager {
    private init() {}
    
    lazy var container: Container = {
        let container = Container()
        container.register(SignInServiceProtocol.self) { _ in
            return SignInService()
            }.inObjectScope(.container)
        
        container.register(SignUpServiceProtocol.self) { _ in
            return SignUpService()
            }.inObjectScope(.container)
        
        container.register(ApiManagerProtocol.self) { _ in
            return APIManager()
            }.inObjectScope(.container)
        
        return container
    }()
    
    static let shared = DependencyManager()
    
    func resolve<T>(interface: T.Type) -> T! {
        return container.resolve(interface)
    }
}

extension DependencyManager {
    static func resolve<T>(interface: T.Type) -> T! {
        return DependencyManager.shared.resolve(interface: interface)
    }
    
    static func register<T>(interface: T.Type, to assembly: T) {
        DependencyManager.shared.register(interface, to: assembly)
    }
    
    public func register<T>(_ interface: T.Type, to assembly: T, scope: ObjectScope = .graph) {
        container.register(interface) { _ in assembly }.inObjectScope(scope)
    }
}

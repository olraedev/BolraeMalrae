//
//  ViewModelType.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation
import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellable: Set<AnyCancellable> { get }
    var input: Input { get }
    var output: Output { get }
    
    func transform()
}

extension ViewModelType {
    func requestToServer<D: Decodable, T: TargetType>(model: D.Type, router: T) async -> D? {
        do {
            let result = try await NetworkManager.shared.requestToAPI(model: model, router: router)
            return result
        } catch {
            return nil
        }
    }
}

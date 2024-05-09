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

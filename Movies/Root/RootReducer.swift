//
//  RootReducer.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct RootReducer : Reducer {
    
    typealias ReducerStateType = RootState
    
    let moviesListingReducer = MoviesListingReducer()
    
    func handleAction(action: Action, state: RootState?) -> RootState {
        if state == nil {
            return RootState()
        }
        return handleDefaultAction(action: action, state: state)
    }
    
    func handleDefaultAction(action: Action, state: RootState?) -> RootState {
        let moviesListingState: MoviesListingState = moviesListingReducer.handleAction(action: action, state: state?.moviesListingState)
        return RootState(moviesListingState: moviesListingState)
    }
    
}

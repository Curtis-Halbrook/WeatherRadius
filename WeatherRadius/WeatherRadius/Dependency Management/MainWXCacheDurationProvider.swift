//
//  MainWXCacheDurationProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 1/2/24.
//

import Foundation


// You may be wondering, why pass a provider instead of just passing a
// number.  The reason is this allows more complex cache logic to be placed
// here if we need in the future.  Say our QA goons want to test without using
// a cache.  We can extend this to have some secret setting in the app to allow
// them to tweak the cache age to zero, and that logic will remain right here
// instead of infiltrating our app code.
//
// It's all about making things flexible for future changes, and suffering a
// little extra coding now...


struct MainWXCacheDurationProvider: WeatherCacheDurationProvider {
    func getCacheDuration() -> TimeInterval {
        return 5 * 60 //Five Minutes
    }
}

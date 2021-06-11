//
//  CardContentModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 6/4/21.
//

import Foundation

protocol EqutableCardContent: Equatable
where FeatureA : ContentFeature,
      FeatureB : ContentFeature,
      FeatureC : ContentFeature,
      FeatureD : ContentFeature {
    associatedtype FeatureA
    associatedtype FeatureB
    associatedtype FeatureC
    associatedtype FeatureD

    var featureA : FeatureA { get }
    var featureB : FeatureB { get }
    var featureC : FeatureC { get }
    var featureD : FeatureD { get }

}

extension EqutableCardContent {
    static func ==(arg1: Self, arg2: Self) -> Bool {
        print("In == func")
        return true
    }
}

protocol ContentFeature: Equatable {
    associatedtype feature
}

extension ContentFeature {
    static func featueIsASet<feature: Equatable> (_ featureA: feature, _ featureB: feature, _ featureC: feature) -> Bool {
        return (featureA == featureB && featureB == featureC) || (featureA != featureB && featureB != featureC && featureA != featureC)
    }
}

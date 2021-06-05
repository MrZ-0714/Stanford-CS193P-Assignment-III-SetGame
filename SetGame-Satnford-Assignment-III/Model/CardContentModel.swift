//
//  CardContentModel.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 6/4/21.
//

import Foundation

struct CardContentModel<FeatureA, FeatureB, FeatureC, FeatureD>: Equatable
where FeatureA: Equatable, FeatureB: Equatable, FeatureC: Equatable, FeatureD: Equatable {
    var featureA: FeatureA
    var featureB: FeatureB
    var featureC: FeatureC
    var featureD: FeatureD
}

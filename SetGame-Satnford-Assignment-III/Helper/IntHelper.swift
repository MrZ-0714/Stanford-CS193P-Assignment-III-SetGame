//
//  IntHelper.swift
//  SetGame-Satnford-Assignment-III
//
//  Created by Zimo Zhao on 6/14/21.
//

import Foundation

extension Int {
    static func randomlyChooseWithNoRepeat(numberOfElement inputNumber: Int, in inputRange: Range<Int>) -> (result: Array<Int>, notChosen: Array<Int>) {
        var randomNonRepeatInt: Array<Int> = [Int]()
        var notChosenInt: Array<Int> = [Int]()
        var maxElementToReturn: Int = inputNumber
        
        if inputNumber > inputRange.count {
            maxElementToReturn = inputRange.count
        }
        
        for _ in 0..<maxElementToReturn {
            var newRandomInt: Int = Int.random(in: inputRange)
            while randomNonRepeatInt.contains(newRandomInt) {
                newRandomInt = Int.random(in: inputRange)
            }
            randomNonRepeatInt.append(newRandomInt)
        }
        
        for i in inputRange {
            if !randomNonRepeatInt.contains(i) {
                notChosenInt.append(i)
            }
        }
        return (result: randomNonRepeatInt, notChosen: notChosenInt)
    }
}

//
//  Utils.swift
//  bmi calculator
//
//  Created by sargam garg on 02/03/16.
//  Copyright © 2016 bitfountain. All rights reserved.
//

import Foundation
import UIKit

open class Utils {
  
  func calculateBmi(_ weight: Float, inchesToCm: Float) -> (Float) {
    let bmi = (weight * 10000 ) / ( inchesToCm * inchesToCm )
    let finalBmi = round(10 * bmi) / 10
    return finalBmi
  }
  
}

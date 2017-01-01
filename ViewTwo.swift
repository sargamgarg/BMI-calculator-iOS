//
//  ViewTwo.swift
//  bmi calculator
//
//  Created by sargam garg on 10/02/16.
//  Copyright © 2016 bitfountain. All rights reserved.
//

import Foundation
import UIKit
class ViewTwo : UIViewController {
  
  //Constants
  let OBESE = "Obese"
  let NORMAL = "Normal"
  let OVER_WEIGHT = "Overweight"
  let UNDER_WEIGHT = "Underweight"
  let appStoreLink = "itms://itunes.apple.com/us/app/healthifyme-weight-loss-coach/id943712366?ls=1&mt=8"
  let bmiLowerRange : Float = 18.5
  let bmiMidRange : Float = 23
  let bmiUpperRange : Float = 27
  
  @IBOutlet weak var bmiDisplayLabel: UILabel!
  @IBOutlet weak var idealWeightLabel: UILabel!
  @IBOutlet weak var bmiStatusLabel: UILabel!
  @IBOutlet weak var tVTitle: UILabel!
  @IBOutlet weak var tvBody: UILabel!
  @IBOutlet weak var getAppButton: UIButton!
  @IBOutlet weak var tvTestCaption: UILabel!
  @IBOutlet weak var tvTestBody: UILabel!
  @IBOutlet weak var bmiColorView: UIView!
  @IBOutlet weak var imageDisplay: UIImageView!
  
  var receivedBmi = "" // contains bmi
  var bmiRange : Float = 0.0
  var heightInFeet = ""
  var heightInCm = ""
  var hifm : Int = 0;
  var hICm : Float = 0;
  var totalInches = "";
  var totInches : Int = 0;
  var idealWeight : Float = 0;
  var bmiStatus = ""
  
  override func viewDidLoad() {
    self.navigationController!.navigationBar.topItem!.title = "";
    bmiDisplayLabel.text! = "Your BMI is \(receivedBmi)" // Printing the bmi
    bmiRange = Float(receivedBmi)!
    displayBmiStatus(bmiRange)
    hICm = Float(heightInCm)!
    idealWeightCalculator(hICm, bmi: bmiRange)
    bmiStatus = bmiStatusLabel.text!
    testDisplay(bmiStatus)
  }
  
  func displayBmiStatus(_ bmiRangeDisplayed : Float) {
    if ( bmiRangeDisplayed < bmiLowerRange ){
      bmiStatusLabel.text! = UNDER_WEIGHT
    } else if ( bmiRangeDisplayed >= bmiLowerRange && bmiRange < bmiMidRange ){
      bmiStatusLabel.text! = NORMAL
    } else if ( bmiRangeDisplayed >= bmiMidRange && bmiRange < bmiUpperRange ){
      bmiStatusLabel.text! = OVER_WEIGHT
    } else if ( bmiRangeDisplayed > bmiUpperRange ){
      bmiStatusLabel.text! = OBESE
    }
  }
  
  func idealWeightCalculator (_ height : Float, bmi : Float) {
    var minIdealWeight : Float = 0
    var maxIdealWeight : Float = 0
    if  (bmi < bmiLowerRange) || (bmi >= bmiLowerRange && bmi < bmiMidRange)
      || (bmi >= bmiMidRange && bmi < bmiUpperRange) || (bmi > bmiUpperRange) {
        minIdealWeight = (bmiLowerRange * height * height) / 10000
        let minIdealWeightRound = round(10 * minIdealWeight) / 10
        maxIdealWeight = (bmiMidRange * height * height) / 10000
        let maxIdealWeightRound = round(10 * maxIdealWeight) / 10
        idealWeightLabel.text! = (" \(minIdealWeightRound) - \(maxIdealWeightRound) Kg")
    }
  }
  
  func testDisplay (_ text : String ) {
    switch(text) {
    case UNDER_WEIGHT :
      var arr : [String] = OptAndTest().displayTestCases(UNDER_WEIGHT)
      tVTitle.text! = String(arr[0])
      tvBody.text! = String(arr[1])
      tvTestCaption.text! = String(arr[2])
      tvTestBody.text! = String(arr[3])
      imageDisplay.image = UIImage(named: ("under"))
      self.bmiColorView.backgroundColor = UIColor.blue;
      break;
      
    case NORMAL:
      var arr : [String] = OptAndTest().displayTestCases(NORMAL)
      tVTitle.text! = String(arr[0])
      tvBody.text! = String(arr[1])
      imageDisplay.image = UIImage(named: ("normal"))
      tvTestCaption.text! = String(arr[2])
      tvTestBody.text! = String(arr[3])
      self.bmiColorView.backgroundColor = UIColor.green;
      break;
      
    case OVER_WEIGHT:
      var arr : [String] = OptAndTest().displayTestCases(OVER_WEIGHT)
      tVTitle.text! = String(arr[0])
      tvBody.text! = String(arr[1])
      imageDisplay.image = UIImage(named: ("overweight"))
      tvTestCaption.text! = String(arr[2])
      tvTestBody.text! = String(arr[3])
      self.bmiColorView.backgroundColor = UIColor.orange;
      break;
      
    case OBESE:
      var arr : [String] = OptAndTest().displayTestCases(OBESE)
      tVTitle.text! = String(arr[0])
      tvBody.text! = String(arr[1])
      imageDisplay.image = UIImage(named: ("obese"))
      tvTestCaption.text! = String(arr[2])
      tvTestBody.text! = String(arr[3])
      self.bmiColorView.backgroundColor = UIColor.red;
      break;
      
    default :
      tVTitle.text! = "Take the first step"
      tvBody.text! = "Try out HealthifyMe and unlock the secret of Natural weightloss"
    }
  }
  
  @IBAction func getAppButtonPressed(_ sender: UIButton) {
    let ourApplication: UIApplication = UIApplication.shared
    let URLEncodedText: String = ""
    let ourPath: String = "hmein://" + URLEncodedText
    let ourURL: URL = URL(string: ourPath)!
    let isInstalled : Bool = ourApplication.openURL(ourURL)
    if (isInstalled){
      ourApplication.openURL(ourURL)
    } else {
      UIApplication.shared.openURL(URL(string: appStoreLink)!)
    }
  }
  
}






















    

//
//  options and tests.swift
//  bmi calculator
//
//  Created by sargam garg on 25/02/16.
//  Copyright © 2016 bitfountain. All rights reserved.
//

import Foundation

open class OptAndTest {
  
  func displayTestCases(_ status : String) -> Array<String>{
    func RandomInt(_ min: Int, max: Int) -> Int {
      if max < min { return min }
      return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    var displayArr : [String] = []
    var optionsTitle: [String] = ["Speak to a HealthifyMe Nutritionist.","Take the first step.","HealthifyMe keeps you going.","Keep going with HealthifyMe.","Take the first step.","Take the first step.","Take the first step.","Kickstart your transformation.","Take ownership of your health."]
    
    var optionsBody: [String] = ["Gain weight the right way with personalized diet plans.","Gain weight the right way with help of HealthifyMe nutritionists.","Tracking calories and quick expert advice can help sustain your BMI.","Maintain your BMI with calorie tracking and personalized expert advice.","Weightloss begins at HealthifyMe. Get the app to start yours today.","HealthifyMe and you share the same goal, your weightloss!","Track your calories and consult your trainer with HealthifyMe.","Weightloss begins at HealthifyMe. Get the app to start yours today."]
    
    var TestTitle: [String] = ["Priyanka, Gained 8 kgs in 3 months.","Kartik, Gained 5 kgs in 2 months.","Mandar, Maintains 61 kgs.","Prathiba, Balancing between 64 and 65 kgs.","Aditya, Lost 8 kgs in 2 months.","Gurjit, Lost 9 kgs in 1.5 months.","Chaitali, Lost 30 kgs in 10 months.","Samarth, Reduced 13 kgs in 4 months."]
    
    var TestBody : [String] = ["Great app to keep track of daily calories! My nutritionist Nishita proved to me that weight gain can be healthy.","My trainer Sahil and HealthifyMe helped me attain my goal. I am so thankful for their kind services and gesture.","I love the weight projection feature! I usually track every day and HealthifyMe has helped me maintain my weight.","HealthifyMe has helped me improve my diet and manage my weight better. The exercise and calorie tracking allows me to track progress, motivating me to meet my targets.","Skipping breakfast is a not an option now thanks to Zuha and her diet plan. I owe my weight loss to her and HealthifyMe.A big thank you.","I have lost  9 kgs in 12 weeks with HealthifyMe and Roshini. Her exercise plan helped me tone my body and get my fat down which I failed to achieve on my own.","Thanks to HealthifyMe I’m successfully diabetes free. With 30 kgs lost in under a year, I see HealthifyMe and Roshini as life savers.","From 36 inches, my waist has shrunk to 32! I have Ritu and HealthifyMe team to thank for such a life changing experience."]
    
    if status == "Underweight" {
      let x = RandomInt (0 , max: 1)
      displayArr = [optionsTitle[x], optionsBody[x], TestTitle[x], TestBody[x]]
    }
    if status == "Normal" {
      let x = RandomInt (2 , max: 3)
      displayArr = [optionsTitle[x], optionsBody[x], TestTitle[x], TestBody[x]]
    }
    else if status == "Overweight" {
      let x = RandomInt (4 , max: 5)
      displayArr = [optionsTitle[x], optionsBody[x], TestTitle[x], TestBody[x]]
    }
    else if status == "Obese" {
      let x = RandomInt (6 , max: 7)
      displayArr = [optionsTitle[x], optionsBody[x], TestTitle[x], TestBody[x]]
    }
    return displayArr
  }
  
  
}

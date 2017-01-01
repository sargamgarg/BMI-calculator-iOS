//
//  ViewController.swift
//  bmi calculator
//
//  Created by sargam garg on 09/02/16.
//  Copyright © 2016 bitfountain. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
  
  // Constants
  let TITLE_NEXT = "Next";
  let SECOND_VIEW_IDENTIFIER = "ViewTwoID"
  let MESSAGE1 = "Looks like you've missed something"
  let MESSAGE2 = "Incorrect value for feet"
  let MESSAGE3 = "Incorrect value for inches.\n Cannot be more than 11."
  let MESSAGE4 = "Incorrect value for weight.\n Cannot be less than 30"
  let MESSAGE5 = "Incorrect value for weight.\n Cannot be more than 200"
  let MESSAGE6 = "Enter your Gender"

  
  @IBOutlet weak var maleButton: UIButton!
  @IBOutlet weak var femaleButton: UIButton!
  @IBOutlet weak var maleLabel: UILabel!
  @IBOutlet weak var femaleLabel: UILabel!
  @IBOutlet weak var feetTextField: UITextField!
  @IBOutlet weak var inchesTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  
  // Variables
  var bmi : Float = 0;
  var feet: Int = 0;
  var inches: Int = 0;
  var weight: Float = 0;
  var totalInches: Int = 0;
  var inchesToCm: Float = 0;
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 128/255, blue: 255, alpha: 1)
    
    self.navigationController!.navigationBar.isTranslucent = false
    
    self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController!.navigationBar.shadowImage = UIImage()
    
    feetTextField.delegate = self
    inchesTextField.delegate = self
    weightTextField.delegate = self
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    
    // removes keyboard when screen is tapped
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
  
  // code to bring up the keyboard and move the elements on top
  
  // MARK: - Keyboard methods
  
  func keyboardWillShow(_ sender: Notification) {
    moveKeyboard(true)
  }
  
  func keyboardWillHide(_ sender: Notification) {
    moveKeyboard(false)
  }
  
  func moveKeyboard(_ upFlag: Bool) {
    if upFlag {
      self.view.frame.origin.y = -130.0
    } else {
      self.view.frame.origin.y = 60
    }
  }
  
  // MARK: - Button clicks
  
  @IBAction func maleButtonPressed(_ sender: UIButton) {
    femaleButton.isHighlighted = true
    maleLabel.isHidden = false
    femaleLabel.isHidden = true
  }
  
  @IBAction func femaleButtonPressed(_ sender: UIButton) {
    maleButton.isHighlighted = true
    femaleLabel.isHidden = false
    maleLabel.isHidden = true
  }
  
  // to limit the input size in the text fields
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if feetTextField.isFirstResponder{
      let length = (textField.text?.characters.count)! + string.characters.count
      if (length > 1) {
        return false
      }
      else{
        return true
      }
    }
    if inchesTextField.isFirstResponder{
      let length = (textField.text?.characters.count)! + string.characters.count
      if (length > 2) {
        return false
      }
      else{
        return true
      }
    }
    if weightTextField.isFirstResponder{
      let length = (textField.text?.characters.count)! + string.characters.count
      if (length > 3) {
        return false
      }
      else{
        return true
      }
    }
    return true
  }
  
  // function for next button on the number pad
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    let keyboardNextButtonShow = UIToolbar(frame: CGRect(x: 0, y: 0,
      width: self.view.frame.size.width, height: self.view.frame.size.height/15))
    keyboardNextButtonShow.barStyle = UIBarStyle .blackTranslucent
    let doneButton = UIBarButtonItem(title: TITLE_NEXT,
      style: UIBarButtonItemStyle.done, target: self,
      action: #selector(ViewController.nextPressed))
    let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
    let toolbarButton = [flexSpace,doneButton]
    keyboardNextButtonShow.setItems(toolbarButton, animated: false)
    feetTextField.inputAccessoryView = keyboardNextButtonShow
    inchesTextField.inputAccessoryView = keyboardNextButtonShow
    weightTextField.inputAccessoryView = keyboardNextButtonShow
    return true
  }
  
  // function to move cursor automatically to the next field
  func nextPressed() {
    if feetTextField.isFirstResponder {
      inchesTextField.becomeFirstResponder()
    } else if inchesTextField.isFirstResponder {
      weightTextField.becomeFirstResponder()
    } else if weightTextField.isFirstResponder {
      weightTextField.resignFirstResponder()
    }
  }
  
  
  func alertDisplay(_ alertMessage: String) -> Bool{
    let alertController: UIAlertController = UIAlertController(title: "Oops!", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
    return false
  }
  
  //  MARK: - View Navigation and Alerts
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender : Any!) -> Bool {
    if ((feetTextField.text!.isEmpty) || (inchesTextField.text!.isEmpty)
      || (weightTextField.text!.isEmpty)) {
        alertDisplay(MESSAGE1)
        return false
    }
    feet = Int(feetTextField.text!)!
    inches = Int(inchesTextField.text!)!
    weight = Float( weightTextField.text!)!
    if(feet == 0) {
      alertDisplay(MESSAGE2)
      return false
    }
    if(inches > 11) {
      alertDisplay(MESSAGE3)
      return false
    }
    if(weight < 30) {
      alertDisplay(MESSAGE4)
      return false
    }
    if(weight > 200) {
      alertDisplay(MESSAGE5)
      return false
    }
    
    if (femaleButton.isHighlighted == false && maleButton.isHighlighted == false) {
      alertDisplay(MESSAGE6)
      return false
    }
    return true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any!)
  {
    let feetToInches = Int (feet) * 12
    totalInches = inches + feetToInches
    inchesToCm = (Float(totalInches) * 2.54)
    bmi = Utils().calculateBmi(weight, inchesToCm: inchesToCm)
    if segue.identifier == SECOND_VIEW_IDENTIFIER {
      let DestViewCont: ViewTwo = segue.destination as! ViewTwo
      DestViewCont.receivedBmi = (String(bmi))
      DestViewCont.heightInCm = (String(inchesToCm))
    }
  }
}



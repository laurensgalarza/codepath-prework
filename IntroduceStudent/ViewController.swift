//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Lauren Galarza on 2/3/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var locationSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majorTextField: UITextField!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    
    @IBOutlet weak var favoriteColorPickerView: UIPickerView!
    
    
    @IBOutlet weak var codingSlider: UISlider!
    
//switch action function
    @IBAction func morePetsSwitchOn(_ sender: UISwitch) {

    }
//favorite color picker view
    
    let arrayOfColors = ["red", "orange", "yellow", "green", "blue", "purple", "pink", "black", "white"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfColors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfColors[row]
    }
    
    var favoriteColor = ""  //favorite color string

    //set favorite color equal to the picked color
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        favoriteColor = arrayOfColors[row]
    }
//Number of Pets stepper
    
    //when the stepper changes, the label will equal the stepper value
        //if the number of pets is 1, then the word "pet" will be used instead of "pet"
    
    var multiplePets = "s"

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
        if (numberOfPetsLabel.text == "1" ) {
            multiplePets = ""
        }
        else {
            multiplePets = "s"
        }
    }
 //Coding Slider
    var sliderAnswer = ""   //slider answer string
    
    @IBAction func codingSliderChanged(_ sender: UISlider) {
        if (sender.value == 0) {
            sliderAnswer = "no"
        }
        else if ((sender.value > 0) && (sender.value <= 0.25)){
            sliderAnswer = "little"
        }
        else if ((sender.value > 0.25) && (sender.value <= 0.5)){
            sliderAnswer = "a moderate amount of"
        }
        else if ((sender.value > 0.5) && (sender.value <= 0.75)){
            sliderAnswer = "a considerable amount of"
        }
        else if ((sender.value > 0.75) && (sender.value <= 1.0)){
            sliderAnswer = "a tremendous amount of"
        }
    }

 //Introduce Self Button
    
    @IBAction func introduceSelfButton(_ sender: UIButton) {
        // Lets us choose the title we have selected from the segmented control
        // In our example that is whether it is first, second, third or forth
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let location = locationSegmentedControl.titleForSegment(at: locationSegmentedControl.selectedSegmentIndex)
        

        
        // Creating a constant of type string that holds an introduction. The introduction receives the values from the outlet connections.
        
        let introduction = "Hi! My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I am from \(location!). I am currently in my \(year!) year at \(schoolNameTextField.text!), where I am studying \(majorTextField.text!). As of right now, I have \(sliderAnswer) experience with coding. A few fun facts about me are that my favorite color is \(favoriteColor), I own \(numberOfPetsLabel.text!) pet\(multiplePets) and it is \(morePetsSwitch.isOn) that I want more pets!"
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //pickerview set up
        favoriteColorPickerView.dataSource = self
        favoriteColorPickerView.delegate = self
        
    }

}


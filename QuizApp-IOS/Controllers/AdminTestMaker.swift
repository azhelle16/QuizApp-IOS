//
//  AdminTestMaker.swift
//  QuizApp-IOS
//
//  Created by Christopher Medina on 3/25/22.
//

import UIKit

class AdminTestMaker: UIViewController {

    @IBOutlet weak var QuizTitle: UITextField!
    
    @IBOutlet weak var Question1: UITextField!
    @IBOutlet weak var CorrectAnswer1: UITextField!
    @IBOutlet weak var WrongAnswer1A: UITextField!
    @IBOutlet weak var WrongAnswer1B: UITextField!
    @IBOutlet weak var WrongAnswer1C: UITextField!
    
    @IBOutlet weak var Question2: UITextField!
    @IBOutlet weak var CorrectAnswer2: UITextField!
    @IBOutlet weak var WrongAnswer2A: UITextField!
    @IBOutlet weak var WrongAnswer2B: UITextField!
    @IBOutlet weak var WrongAnswer2C: UITextField!
    
    @IBOutlet weak var Question3: UITextField!
    @IBOutlet weak var CorrectAnswer3: UITextField!
    @IBOutlet weak var WrongAnswer3A: UITextField!
    @IBOutlet weak var WrongAnswer3B: UITextField!
    @IBOutlet weak var WrongAnswer3C: UITextField!
    
    @IBOutlet weak var Question4: UITextField!
    @IBOutlet weak var CorrectAnswer4: UITextField!
    @IBOutlet weak var WrongAnswer4A: UITextField!
    @IBOutlet weak var WrongAnswer4B: UITextField!
    @IBOutlet weak var WrongAnswer4C: UITextField!
    
    @IBOutlet weak var Question5: UITextField!
    @IBOutlet weak var CorrectAnswer5: UITextField!
    @IBOutlet weak var WrongAnswer5A: UITextField!
    @IBOutlet weak var WrongAnswer5B: UITextField!
    @IBOutlet weak var WrongAnswer5C: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func Cancel(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
    
    @IBAction func SaveToIOS(_ sender: Any)
    {

        var Quiz = QuizModels(Title: QuizTitle.text!, Technology_Title: "IOS")
        
        var wrong_choices: Array<String> = [WrongAnswer1A.text!, WrongAnswer1B.text!, WrongAnswer1C.text!]
        var Question1 = QuestionModels(Question: Question1.text!, Awnser: CorrectAnswer1.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer2A.text!, WrongAnswer2B.text!, WrongAnswer2C.text!]
        var Question2 = QuestionModels(Question: Question2.text!, Awnser: CorrectAnswer2.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer3A.text!, WrongAnswer3B.text!, WrongAnswer3C.text!]
        var Question3 = QuestionModels(Question: Question3.text!, Awnser: CorrectAnswer3.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer4A.text!, WrongAnswer4B.text!, WrongAnswer4C.text!]
        var Question4 = QuestionModels(Question: Question4.text!, Awnser: CorrectAnswer4.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer5A.text!, WrongAnswer5B.text!, WrongAnswer5C.text!]
        var Question5 = QuestionModels(Question: Question5.text!, Awnser: CorrectAnswer5.text!, choice: wrong_choices)
        
        Quiz.Questions = [Question1, Question2, Question3, Question4, Question5 ]
        Quiz.save()
        
        self.dismiss(animated: true)
    }
    
    @IBAction func SaveToAndroid(_ sender: Any)
    {
        var Quiz = QuizModels(Title: QuizTitle.text!, Technology_Title: "Android")
        
        var wrong_choices: Array<String> = [WrongAnswer1A.text!, WrongAnswer1B.text!, WrongAnswer1C.text!]
        var Question1 = QuestionModels(Question: Question1.text!, Awnser: CorrectAnswer1.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer2A.text!, WrongAnswer2B.text!, WrongAnswer2C.text!]
        var Question2 = QuestionModels(Question: Question2.text!, Awnser: CorrectAnswer2.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer3A.text!, WrongAnswer3B.text!, WrongAnswer3C.text!]
        var Question3 = QuestionModels(Question: Question3.text!, Awnser: CorrectAnswer3.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer4A.text!, WrongAnswer4B.text!, WrongAnswer4C.text!]
        var Question4 = QuestionModels(Question: Question4.text!, Awnser: CorrectAnswer4.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer5A.text!, WrongAnswer5B.text!, WrongAnswer5C.text!]
        var Question5 = QuestionModels(Question: Question5.text!, Awnser: CorrectAnswer5.text!, choice: wrong_choices)
        
        Quiz.Questions = [Question1, Question2, Question3, Question4, Question5 ]
        Quiz.save()
        
        self.dismiss(animated: true)
    }
    
    @IBAction func SaveToJava(_ sender: Any)
    {
        var Quiz = QuizModels(Title: QuizTitle.text!, Technology_Title: "Java")
        
        var wrong_choices: Array<String> = [WrongAnswer1A.text!, WrongAnswer1B.text!, WrongAnswer1C.text!]
        var Question1 = QuestionModels(Question: Question1.text!, Awnser: CorrectAnswer1.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer2A.text!, WrongAnswer2B.text!, WrongAnswer2C.text!]
        var Question2 = QuestionModels(Question: Question2.text!, Awnser: CorrectAnswer2.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer3A.text!, WrongAnswer3B.text!, WrongAnswer3C.text!]
        var Question3 = QuestionModels(Question: Question3.text!, Awnser: CorrectAnswer3.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer4A.text!, WrongAnswer4B.text!, WrongAnswer4C.text!]
        var Question4 = QuestionModels(Question: Question4.text!, Awnser: CorrectAnswer4.text!, choice: wrong_choices)
        
        wrong_choices = [WrongAnswer5A.text!, WrongAnswer5B.text!, WrongAnswer5C.text!]
        var Question5 = QuestionModels(Question: Question5.text!, Awnser: CorrectAnswer5.text!, choice: wrong_choices)
        
        Quiz.Questions = [Question1, Question2, Question3, Question4, Question5 ]
        Quiz.save()
        
        self.dismiss(animated: true)
    }
}
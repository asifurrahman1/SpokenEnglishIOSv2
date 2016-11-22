//
//  QuizCell.swift
//  Test_learning_app
//
//  Created by Md Asifur Rahman on 9/8/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit




class QuizCell: BaseCell,SSRadioButtonControllerDelegate {
    
    var question: Questions? {
        didSet {
            self.questionNo.text = "Question No : \(question!.no!)"
            self.questionLabel.text = question?.Question
            self.radio1.titleLabel?.text = question?.option1
            self.radio2.titleLabel?.text = question?.option2
            self.radio3.titleLabel?.text = question?.option3
            self.radio4.titleLabel?.text = question?.option4
        }
    }
    
    let questionNo : UILabel = {
        let qn = UILabel()
        //*******************
        qn.backgroundColor = Colors.QuizNoBackColor//.purpleColor()
        qn.text = "Question no : 1"
        qn.textColor = Colors.QuizNoBackTextColor//.whiteColor()
        qn.textAlignment = .Center
        //******************
        qn.translatesAutoresizingMaskIntoConstraints = false
        return qn;
    }()
    
    let questionLabel: UILabel = {
        let qs = UILabel()
        qs.translatesAutoresizingMaskIntoConstraints = false
        qs.text = "What is the meaning of the word - Adorable "
        qs.textAlignment = .Center
        qs.numberOfLines = 4
        //************COLOR*****************
        qs.backgroundColor = Colors.QuizQuestionBackColor//UIColor.lightGrayColor()
        qs.textColor = Colors.QuizQuestionTextColor//UIColor.blackColor()
        //*********************************
        return qs
    }()
    
    let radio1:SSRadioButton = {
        let r = SSRadioButton()
        //*******************
        r.circleColor = .blueColor()
        r.circleRadius = 8
        //*******************
        r.setTitle("Option 1", forState:.Normal)
        r.contentHorizontalAlignment = .Left
        r.setTitleColor(.blackColor(), forState: .Normal)
        r.selected = false
        r.tag = 1
        return r
    }()
    
    let radio2:SSRadioButton = {
        let r = SSRadioButton()
        //*******************
        r.circleColor = .blueColor()
        r.circleRadius = 8
        //*******************
        r.setTitle("Option 2", forState:.Normal)
        r.contentHorizontalAlignment = .Left
        r.setTitleColor(.blackColor(), forState: .Normal)
        r.selected = false
        r.tag = 2
        return r
    }()
    
    let radio3:SSRadioButton = {
        let r = SSRadioButton()
        //*******************
        r.circleColor = .blueColor()
        r.circleRadius = 8
        //*******************
        r.setTitle("Option 3", forState:.Normal)
        r.contentHorizontalAlignment = .Left
        r.setTitleColor(.blackColor(), forState: .Normal)
        r.selected = false
        r.tag = 3
        return r
    }()
    
    let radio4:SSRadioButton = {
        let r = SSRadioButton()
        //*******************
        r.circleColor = .blueColor()
        r.circleRadius = 8
        //*******************
        r.setTitle("Option 4", forState:.Normal)
        r.contentHorizontalAlignment = .Left
        r.setTitleColor(.blackColor(), forState: .Normal)
        r.selected = false
        r.tag = 4
        return r
    }()
    
    
    
    //var current:UIButton?
    var radioButtonController:SSRadioButtonsController?
    
    override func setupViews() {
        
        addSubview(questionNo)
        addConstraintsWithFormat("H:|[v0]|", views: questionNo)
        addConstraintsWithFormat("V:|[v0(30)]", views: questionNo)
        
        addSubview(questionLabel)
        addConstraintsWithFormat("H:|[v0]|", views: questionLabel)
        addConstraintsWithFormat("V:|-31-[v0(50)]", views: questionLabel)
        
        
        addSubview(radio1)
        addSubview(radio2)
        addSubview(radio3)
        addSubview(radio4)
        /*
         print(radio1.tag)
         print(radio2.tag)
         print(radio3.tag)
         print(radio4.tag)
         */
        addConstraintsWithFormat("H:|-100-[v0]|", views: radio1)
        addConstraintsWithFormat("H:|-100-[v0]|", views: radio2)
        addConstraintsWithFormat("H:|-100-[v0]|", views: radio3)
        addConstraintsWithFormat("H:|-100-[v0]|", views: radio4)
        addConstraintsWithFormat("V:|-90-[v0(30)]-20-[v1(30)]-20-[v2(30)]-20-[v3(30)]", views: radio1,radio2,radio3,radio4)
        
        //************COLOR*****************
        
        backgroundColor = Colors.QuizMCQbackColor
        //*********************************
        
        
        radioButtonController = SSRadioButtonsController(buttons: radio1,radio2,radio3,radio4)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        
        
        // let current = radioButtonController?.selectedButton()
        //print(current?.tag)
    }
    
    var quiz = Quiz()
    
    
    
    func didSelectButton(aButton: UIButton?) {
        let ans = Answers()
        
        ans.Question_no =  Int(self.questionNo.text!)
        ans.Ans_no = aButton?.tag
        
        self.quiz.setAnswer(ans)
        // print("\(ans.Question_no!)-------\(ans.Ans_no!)")
        //Answer_script.answers?.append(ans)
    }
    
    
}

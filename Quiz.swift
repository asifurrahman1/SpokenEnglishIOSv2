//
//  Quiz.swift
//  Test_learning_app
//
//  Created by Md Asifur Rahman on 9/8/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit
//
//  Dictionary.swift
//  Test_learning_app
//
//  Created by Md Asifur Rahman on 9/8/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class Quiz:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,SSRadioButtonControllerDelegate{
    
    //************************************
    //var Time_in_sec:Int?
    var QuizQuestion: [Questions]?
    //************************************
    
    func setQuiz(){
        
        let q1 = Questions()
        q1.no = 1
        q1.Question = "What is the meaning of - Abort"
        q1.option1 = "option1"
        q1.option2 = "option2"
        q1.option3 = "option3"
        q1.option4 = "option4"
        q1.ans = 2
        
        let q2 = Questions()
        q2.no = 2
        q2.Question = "What is the meaning of - Abide"
        q2.option1 = "option1"
        q2.option2 = "option2"
        q2.option3 = "option3"
        q2.option4 = "option4"
        q2.ans = 4
        
        QuizQuestion = [q1,q2]
    }
    
    var QuizTime:Int = 8
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var clock:ClockView = {
        let time = ClockView()
        time.backgroundColor =  Colors.body//.blueColor()
        //time.backgroundColor = UIColor.clearColor()
        //#################SET CLOCK TIME######################################
        
        //#######################################################
        return time
    }()
    
    let quizName: UILabel = {
        let ql = UILabel()
        ql.text = "Vocabulary Test 1"
        ql.textAlignment = .Center
        //###################################
        ql.textColor = Colors.BodyTextColor
        ql.backgroundColor = Colors.body
        //###################################
        return ql
    }()
    
    let quizTime: UILabel = {
        let ql = UILabel()
        ql.text = "Time : 20 min"
        ql.textAlignment = .Center
        //###################################
        ql.textColor = Colors.BodyTextColor//.blackColor()
        ql.backgroundColor = Colors.body//.blueColor()
        //###################################
        return ql
    }()
    
    let Result: UILabel = {
        let ql = UILabel()
        ql.textAlignment = .Center
        //###################################
        ql.textColor =  Colors.BodyTextColor
        ql.backgroundColor = Colors.body//.blueColor()
        //###################################
        return ql
    }()
    
    
    
    
    
    var startQuiz = false
    
    lazy var Startbutton: UIButton = {
        let button = UIButton(type: .System )
        button.setTitle("Press To Start Quiz", forState: .Normal)
        button.addTarget(self, action: #selector(handlePressed), forControlEvents: .TouchUpInside)
        button.backgroundColor = UIColor.whiteColor()
        return button
    }()
    
    lazy var AgainButton: UIButton = {
        let button = UIButton(type: .System )
        button.setTitle("Return", forState: .Normal)
        button.addTarget(self, action: #selector(RestartQuiz), forControlEvents: .TouchUpInside)
        button.backgroundColor = UIColor.whiteColor()
        return button
    }()
    
    
    func handlePressed(){
        self.Startbutton.hidden = true
        self.backgroundColor = UIColor.blueColor()
        self.clock.hidden = false
        clock.startClockTimer()
        self.collectionView.hidden = false
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|-101-[v0]|", views: collectionView)
        collectionView.registerClass(QuizCell.self, forCellWithReuseIdentifier: cellId)
        mytimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:  Selector("CheckTime"), userInfo: nil, repeats: true)
    }
    
    func RestartQuiz(){
        self.AgainButton.hidden = true
        self.clock.setTimer(QuizTime)
        addSubview(clock)
        
        self.collectionView.hidden = true
        
        addConstraintsWithFormat("H:|[v0]|", views: clock)
        addConstraintsWithFormat("V:|[v0]", views: clock)
        addConstraint(NSLayoutConstraint(item: clock, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 100))
        
        addSubview(quizName)
        addConstraintsWithFormat("H:|[v0]|", views: quizName)
        addConstraintsWithFormat("V:|-100-[v0(30)]", views: quizName)
        
        addSubview(quizTime)
        addConstraintsWithFormat("H:|[v0]|", views: quizTime)
        addConstraintsWithFormat("V:|-130-[v0(30)]", views: quizTime)
        
        addSubview(Startbutton)
        addConstraintsWithFormat("H:|-100-[v0(200)]|", views: Startbutton)
        addConstraintsWithFormat("V:|-161-[v0(50)]", views: Startbutton)
        
        self.Startbutton.hidden = false
        self.backgroundColor = Colors.body//UIColor.blueColor()
        self.collectionView.hidden = true
        
    }
    
    
    let cellId = "cellId"
    
    var flag:Bool = false
    var mytimer:NSTimer?
    
    
    override func setupViews() {
        
        
        super.setupViews()
        
        setQuiz()
        
        self.clock.setTimer(QuizTime)
        addSubview(clock)
        
        addConstraintsWithFormat("H:|[v0]|", views: clock)
        addConstraintsWithFormat("V:|[v0]", views: clock)
        addConstraint(NSLayoutConstraint(item: clock, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 100))
        
        addSubview(quizName)
        addConstraintsWithFormat("H:|[v0]|", views: quizName)
        addConstraintsWithFormat("V:|-100-[v0(30)]", views: quizName)
        
        addSubview(quizTime)
        addConstraintsWithFormat("H:|[v0]|", views: quizTime)
        addConstraintsWithFormat("V:|-130-[v0(30)]", views: quizTime)
        
        addSubview(Startbutton)
        addConstraintsWithFormat("H:|-100-[v0(200)]|", views: Startbutton)
        addConstraintsWithFormat("V:|-161-[v0(50)]", views: Startbutton)
        
        
        self.Startbutton.hidden = false
        self.backgroundColor = Colors.body//UIColor.blueColor()
        self.collectionView.hidden = true
        
    }
    
    var Ans = [Answers]()
    func setAnswer(ans:Answers){
        self.Ans.append(ans)
    }
    
    func CheckTime(){
        let time = clock.timerValue!
        // print(time)
        if(time==0){
            //###################call another window here #################
            
            mytimer?.invalidate()
            //print(Ans.count)
            for a in Ans{
                print("\(a.Question_no!)-------\(a.Ans_no!)")
            }
            self.collectionView.hidden = true
            self.clock.hidden = true
            self.backgroundColor = Colors.body
            let score = 100
            self.Result.text = "Your Score is \(score)"
            addSubview(Result)
            addConstraintsWithFormat("H:|[v0]|", views: Result)
            addConstraintsWithFormat("V:|-200-[v0(50)]|", views: Result)
            
            addSubview(AgainButton)
            addConstraintsWithFormat("H:|[v0]|", views: AgainButton)
            addConstraintsWithFormat("V:|-255-[v0(50)]|", views: AgainButton)
            self.AgainButton.hidden = false
        }
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return QuizQuestion?.count ?? 0
        //return
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)as! QuizCell
        cell.question = QuizQuestion?[indexPath.item]
        // cell.quiz = self
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)as! QuizCell
        
        
        //  Ans.append(cell.ans)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(frame.width, height + 16 + 88)
        // return CGSizeMake(frame.width, )
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
}


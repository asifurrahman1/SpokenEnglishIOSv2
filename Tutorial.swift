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


class Tutorial:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var data : [VideoLessonModel]?
    var weeks = [TutorialWeek]()
    var Tutorials = [VideoLessonModel]()
    
  
   func fetchlesson(){
    let fetch = FetchLessonFrmCore()
    Tutorials = fetch.fetchAndSetResult()
      if (Tutorials.isEmpty){
      print("CORE DATA  EMPTY")
      }
      else{
      print("CORE DATA  NOT EMPTY")
         var num_of_tutorial_per_day = Tutorials.count
         print(num_of_tutorial_per_day/12*4*7)
        // print(num_of_tutorial_per_day)
      
        
        var week_counter = 1;
        var tutorial_counter = 0;
        //#############################################
        for(var m = 1;m<=12;m++){
            for(var w = 1;w<=4;w++){
            var week = TutorialWeek()
            var Days = [PerDay]()
                for(var d = 1;d<=6;d++){
                    var day = PerDay()
                    day.DayNo = d;
                    var day_tutorials = [Tutorial_Obj]()
                    if (num_of_tutorial_per_day<=10){
                        while(num_of_tutorial_per_day>0){
                        let t = Tutorial_Obj()
                        t.TutorialName = Tutorials[tutorial_counter].name!
                        print(t.TutorialName!)
                        t.Tutorial_url = Tutorials[tutorial_counter].url!
                        print(t.Tutorial_url!)
                        day_tutorials.append(t)
                        tutorial_counter = tutorial_counter + 1
                        num_of_tutorial_per_day = num_of_tutorial_per_day - 1
                        }
                    }
                    else{
                        var k = 20
                        while(k>0){
                            let t = Tutorial_Obj()
                            t.TutorialName = Tutorials[tutorial_counter].name!
                            print(t.TutorialName!)
                            t.Tutorial_url = Tutorials[tutorial_counter].url!
                            print(t.Tutorial_url!)
                            day_tutorials.append(t)
                            tutorial_counter = tutorial_counter + 1
                            num_of_tutorial_per_day = num_of_tutorial_per_day - 1
                            k = k - 1
                        }
                    }
                    day.Days_tutorials = day_tutorials
                    Days.append(day)
                }
                week.WeekNo = week_counter;
                
                week.days = Days
               // print("WEEK inserted")
                //self.WEEKS?.append(week)
                weeks.append(week)
                print("week inserted: \(week_counter)")
                week_counter = week_counter + 1
            }
            
        }
       //#############################################
        
       print("number of week --- \(weeks.count)")
      }
    
    
    
   }
    
    
    
    
    
    func  addWeeks(){
        //--------------------------------------------------
        let week1 = TutorialWeek()
       // let sub1 = Subject()
        var Days1 = [PerDay]()
        
        //--------------------------------------------------
        let day1 = PerDay()
        day1.DayNo = 1
        
        let t1 = Tutorial_Obj()
        t1.TutorialName = "Vocabulary 1"
        t1.Tutorial_url = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        
        let t2 = Tutorial_Obj()
        t2.TutorialName = "Vocabulary 2"
        t2.Tutorial_url = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        
        let t3 = Tutorial_Obj()
        t3.TutorialName = "Vocabulary 3"
        t3.Tutorial_url = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        
        var tutorials1 = [Tutorial_Obj]()
        tutorials1 = [t1,t2,t3]
        day1.Days_tutorials = tutorials1
        
        //--------------------------------------------------
        let day2 = PerDay()
        day2.DayNo = 2
        var tutorials2 = [Tutorial_Obj]()
        let t = Tutorial_Obj()
        t.TutorialName = "VOcabulary 2"
        t.Tutorial_url = "https://www.youtube.com/watch?v=d1_M0mZrZHI"
        tutorials2.append(t)
        tutorials2.append(t)
        tutorials2.append(t)
        tutorials2.append(t)
        tutorials2.append(t)
        tutorials2.append(t)
        
        day2.Days_tutorials = tutorials2
        //--------------------------------------------------
        
        //sub1.subject_name = "Vocalbullary"
       // sub1.Total_hours = 4
        
        Days1 = [day1,day2,day1,day1,day2,day1]
        
        week1.WeekNo = 1
        week1.days = Days1
        
        
       // weeks = [week1,week1,week1,week1,week1,week1,week1]
        
    }
    
   
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Colors.body//UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    var homecontroller:HomeController?
    
    
    override func setupViews(){
        super.setupViews()
        backgroundColor = Colors.body
        fetchlesson()
        //addWeeks()
        addSubview(collectionView)
        addConstraintsWithFormat("H:|-5-[v0]-5-|", views: collectionView)
        addConstraintsWithFormat("V:|-5-[v0]-5-|", views: collectionView)
        collectionView.registerClass(TutorialCell.self, forCellWithReuseIdentifier: cellId)
    
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return weeks.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! TutorialCell
        cell.Week = weeks[indexPath.item]
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // let height = (frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(frame.width-5,100 )
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        if let W:TutorialWeek = self.weeks[indexPath.item]{
           // print(W.Sub!.subject_name!)
            
            // self.homecontroller?.showControllerForTutorial(W)
            self.homecontroller?.showDetailedControllerForTutorial(W)
        }
        
    }
    
    
}


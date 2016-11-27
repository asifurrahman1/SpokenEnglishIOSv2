

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // let cellId = "cellId"
    let tutorialId = "TutorialID"
    let dictionaryId = "dictionaryID"
    let quizId = "quizId"
    let profileId = "profileId"
    
    
    let titles = ["Account", "Tutorial", "Dictionary", "Quiz"]
    var indexno:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.translucent = false
        let titleLabel = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
       // titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        
        navigationItem.titleView = titleLabel
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
    }
    
    
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .Horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        //#####################################################################################
        collectionView?.registerClass(ProfileView.self, forCellWithReuseIdentifier: profileId)
        // collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: tutorialId)
        collectionView?.registerClass(Tutorial.self, forCellWithReuseIdentifier: tutorialId)
        collectionView?.registerClass(DictionaryController.self, forCellWithReuseIdentifier: dictionaryId)
        collectionView?.registerClass(Quiz.self, forCellWithReuseIdentifier: quizId)
        
        //#####################################################################################
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        collectionView?.pagingEnabled = true
    }
    
    func setupNavBarButtons() {
        //let searchImage = UIImage(named: "search_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        // let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .Plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "navigation")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButton]
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    func handleMore() {
        //show menu
        settingsLauncher.showSettings()
    }
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.whiteColor()
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
    
    
    
    /*
     func showControllerForTutorial(week:TutorialWeek){
     let tutorialViewController = UIViewController()
     tutorialViewController.view.backgroundColor = UIColor.whiteColor()
     tutorialViewController.navigationItem.title = "Week no : \(week.WeekNo!)"
     navigationController?.navigationBar.tintColor = UIColor.whiteColor()
     navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
     navigationController?.pushViewController(tutorialViewController, animated: true)
     }
     */
    //##############################################################################################
    
    func showDetailedControllerForTutorial(week:TutorialWeek){
        let tutorialViewController = TutorialDetails()
        tutorialViewController.navigationItem.title = "Week no : \(week.WeekNo!)"
        tutorialViewController.tutorails = week
        tutorialViewController.homecontroller = self
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        navigationController?.pushViewController(tutorialViewController, animated: true)
    }
    //##############################################################################################
    
    //##############################################################################################
    let tutorialLauncher = TutorialDetails()
    
    func tutorialDaysLauncher(day:PerDay){
        //tutorialLauncher.homecontroller = self
        launchDayTutorial(day)
    }
    
    func launchDayTutorial(day:PerDay){
        let tutorialViewController =  VideoLaunchController()
        tutorialViewController.navigationItem.title = "Day no : \(day.DayNo!)"
        tutorialViewController.Tutorials = day
        tutorialViewController.homecontroller = self
        /* if let lessons = day.Days_tutorials{
         tutorialViewController.TutorialURL = lessons
         }
         */
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.pushViewController(tutorialViewController, animated: true)
    }
    //##############################################################################################
    //##############################################################################################
    func PlayVideo(url:Tutorial_Obj){
        //tutorialLauncher.homecontroller = self
        launchTutorial(url)
    }
    
    func launchTutorial(url:Tutorial_Obj){
        let tutorialViewController =  VideoPlay()
        tutorialViewController.navigationItem.title = "\(url.TutorialName!)"
        if let link = url.Tutorial_url{
            tutorialViewController.link = link
        }
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.pushViewController(tutorialViewController, animated: true)
    }
    
    
    
    
    
    
    //##############################################################################################
    
    
    func handleSearch() {
        //*****************************
        
        
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(forItem: menuIndex, inSection: 0)
        collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
        
        setTitleForIndex(menuIndex)
    }
    
    private func setTitleForIndex(index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[index])"
        }
        
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    private func setupMenuBar() {
        //navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.backgroundColor = Colors.TopBar// UIColor(red: 255/255, green: 213/255, blue: 131/255, alpha: 1)
        
        view.addSubview(redView)
        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
        view.addConstraintsWithFormat("V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.memory.x / view.frame.width
        
        let indexPath = NSIndexPath(forItem: Int(index), inSection: 0)
        menuBar.collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        
        //*************SETTING THE TITLE OF THE NAVIGATION MENU************************
        setTitleForIndex(Int(index))
    }
    
    
    
    
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    var profile:Profile?
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //*************************SETTING DIFFERENT MODEL FOR DIFFERENT TAB*********************
        
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(dictionaryId, forIndexPath: indexPath)
            return cell
            
        }
        if indexPath.item == 3{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(quizId, forIndexPath: indexPath)
            return cell
            
        }
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(tutorialId, forIndexPath: indexPath)as! Tutorial
            cell.homecontroller = self
            return cell
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(profileId, forIndexPath: indexPath)
        return cell
        //******************************************************************************************
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, view.frame.height - 50)
    }
    
    
}







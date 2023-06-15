import CoreData

func registSampleData(context: NSManagedObjectContext) {
    
    /// テーブル初期値
    let campSiteList = [
        ["001", "ふもとっぱらキャンプ場","url","4.2","false","", "5", "8", "3","5"],
        ["002", "陣馬形山キャンプ場","url","4.5","false","", "2", "10", "1","3"]
    ]
    
    /// テーブル全消去
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    fetchRequest.entity = CampSite.entity()
    let campSites = try? context.fetch(fetchRequest) as? [CampSite]
//    if(campSites?.count == 0){
        for campSite in campSites! {
            context.delete(campSite)
        }
        /// テーブル登録
        for campSite in campSiteList {
            let newCampSite = CampSite(context: context)
            newCampSite.id = campSite[0]         //id
            newCampSite.name = campSite[1]        // キャンプ場名
            newCampSite.url =  campSite[2] // url
            newCampSite.review = Float(campSite[3])! // review
            newCampSite.favorite = Bool(campSite[4])! // favorite
            newCampSite.memo = campSite[5] // memo

            newCampSite.januaryMin = Int16(campSite[6])!  // 1月最低気温
            newCampSite.januaryMax = Int16(campSite[7])!  // 1月最高気温
            newCampSite.februaryMin = Int16(campSite[8])!  // 2月最低気温
            newCampSite.februaryMax = Int16(campSite[9])!  // 2月最高気温
        }
        
        /// コミット
        try? context.save()
    }
//}

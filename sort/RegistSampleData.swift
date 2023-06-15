import CoreData

func registSampleData(context: NSManagedObjectContext) {
    
    /// テーブル初期値
    let campSiteList = [
        ["001", "ふもとっぱら","https://reserve.fumotoppara.net/reserved/reserved-calendar-list","3.9","false","","fumoto","35.399567917778164", "138.56501585339282",
         "-5", "5", "-3","6", "-1", "9",
         "4","16", "9", "20", "14","22",
         "18", "26", "19","28", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["002", "陣馬形山","https://www.nap-camp.com/nagano/12246?ref_host=widget","4.2","false","","jinnba",
         "35.6727697255131", "137.9831038423283",
         "-10", "1", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "12", "25", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["003", "南乗鞍岳","https://www.nap-camp.com/gifu/10410","4.0","false","","minami",
         "36.0771965350051", "137.47704983717105",
         "-12", "0", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "10", "22", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["004", "くるみ温泉","https://www.nap-camp.com/gifu/10423","4.4","false","","kurumi",
         "35.399567917778164", "138.56501585339282",
         "-3", "2", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "14", "27", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["005", "PICA富士","https://www.nap-camp.com/shizuoka/11816","4.4","false","","pica",
         "35.399567917778164", "138.56501585339282",
         "-3", "7", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["006", "南伊豆夕日ヶ丘","https://www.nap-camp.com/shizuoka/11783","4.1","false","","yuuhi",
         "34.69646697292135", "138.7624608110437",
         "6", "10", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["007", "CampFantasea","https://www.nap-camp.com/shizuoka/11816","4.5","false","","fan",
         "35.399567917778164", "138.56501585339282",
         "4", "9", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["008", "RECAMP","https://www.nap-camp.com/shizuoka/11816","4.2","false","","re",
         "35.399567917778164", "138.56501585339282",
         "5", "11", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["009", "川の駅","https://www.nap-camp.com/shizuoka/11816","3.8","false","","kawa",
         "35.399567917778164", "138.56501585339282",
         "4", "12", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"],
        ["010", "伊豆キャンファーム","https://www.nap-camp.com/shizuoka/11816","4.6","false","","izu",
         "35.399567917778164", "138.56501585339282",
         "4", "8", "-3","6", "-1", "9",
         "4","16", "9", "20", "9","18",
         "16", "28", "16","26", "16", "24",
         "10","18", "3", "13", "-3","8"]
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
        newCampSite.image = campSite[6] // image
        newCampSite.ido = Double(campSite[7])! // ido
        newCampSite.keido = Double(campSite[8])! // keido
        
        newCampSite.januaryMin = Int16(campSite[9])!  // 1月最低気温
        newCampSite.januaryMax = Int16(campSite[10])!  // 1月最高気温
        newCampSite.februaryMin = Int16(campSite[11])!  // 2月最低気温
        newCampSite.februaryMax = Int16(campSite[12])!  // 2月最高気温
        newCampSite.marchMin = Int16(campSite[13])!  // 1月最低気温
        newCampSite.marchMax = Int16(campSite[14])!  // 1月最高気温
//        newCampSite.aprilMin = Int16(campSite[15])!  // 1月最低気温
//        newCampSite.aprilMax = Int16(campSite[16])!  // 1月最高気温
//        newCampSite.mayMin = Int16(campSite[17])!  // 1月最低気温
//        newCampSite.mayMax = Int16(campSite[18])!  // 1月最高気温
//        newCampSite.juneMin = Int16(campSite[19])!  // 1月最低気温
//        newCampSite.juneMax = Int16(campSite[20])!  // 1月最高気温
//        newCampSite.julyMin = Int16(campSite[21])!  // 1月最低気温
//        newCampSite.julyMax = Int16(campSite[22])!  // 1月最高気温
//        newCampSite.augustMin = Int16(campSite[23])!  // 1月最低気温
//        newCampSite.augustMax = Int16(campSite[24])!  // 1月最高気温
//        newCampSite.septemberMin = Int16(campSite[25])!  // 1月最低気温
//        newCampSite.septemberMax = Int16(campSite[26])!  // 1月最高気温
//        newCampSite.octoberMin = Int16(campSite[27])!  // 1月最低気温
//        newCampSite.octoberMax = Int16(campSite[28])!  // 1月最高気温
//        newCampSite.novemberMin = Int16(campSite[29])!  // 1月最低気温
//        newCampSite.novemberMax = Int16(campSite[30])!  // 1月最高気温
//        newCampSite.decemberMin = Int16(campSite[31])!  // 1月最低気温
//        newCampSite.decemberMax = Int16(campSite[32])!  // 1月最高気温
    }
    
    /// コミット
    try? context.save()
}
//}

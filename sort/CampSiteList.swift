import SwiftUI

struct CampSiteList: View {
    @EnvironmentObject var selectedData:SelectedData
    /// 被管理オブジェクトコンテキスト（ManagedObjectContext）の取得
    @Environment(\.managedObjectContext) private var context
    /// ①FetchRequestの保存用
    var fetchRequest: FetchRequest<CampSite>
    
    /// ②FetchRequestの生成
    init(monthMin:String,
         min:Int16,
         monthMax:String,
         max:Int16,
         sortKey:Int16)
    {
        switch sortKey{
        case 0:
            fetchRequest = FetchRequest<CampSite>(
                entity: CampSite.entity(),
                sortDescriptors: [NSSortDescriptor(key:monthMin, ascending: false),
                                  NSSortDescriptor(key:"favorite", ascending: false)],
                predicate: NSPredicate(format: "(%K => %d) && (%K =< %d)",monthMin, min,monthMax,max),
                animation: .default
            )
        case 1:
            fetchRequest = FetchRequest<CampSite>(
                entity: CampSite.entity(),
                sortDescriptors: [NSSortDescriptor(key:monthMax, ascending: true),
                                  NSSortDescriptor(key:"favorite", ascending: false)],
                predicate: NSPredicate(format: "(%K => %d) && (%K =< %d)",monthMin, min,monthMax,max),
                animation: .default
            )
        case 2:
            fetchRequest = FetchRequest<CampSite>(
                entity: CampSite.entity(),
                sortDescriptors: [NSSortDescriptor(key:"review", ascending: false),
                                  NSSortDescriptor(key:"favorite", ascending: false)],
                predicate: NSPredicate(format: "(%K => %d) && (%K =< %d)",monthMin, min,monthMax,max),
                animation: .default
            )
        case 3:
            fetchRequest = FetchRequest<CampSite>(
                entity: CampSite.entity(),
                sortDescriptors: [NSSortDescriptor(key:"favorite", ascending: false),NSSortDescriptor(key:monthMin, ascending: false)],
                predicate: NSPredicate(format: "(%K => %d) && (%K =< %d)",monthMin, min,monthMax,max),
                animation: .default
            )
        default:
            fetchRequest = FetchRequest<CampSite>(
                entity: CampSite.entity(),
                sortDescriptors: [NSSortDescriptor(key:monthMin, ascending: false),
                                  NSSortDescriptor(key:"favorite", ascending: false)],
                predicate: NSPredicate(format: "(%K => %d) && (%K =< %d)",monthMin, min,monthMax,max),
                animation: .default
            )
        }
        
    }
    
    
    
    var body: some View {
        List {
            ForEach(fetchRequest.wrappedValue, id: \.self) { campSite in
                Section(header: HStack {
                    HStack {
                        Text("\(campSite.name!)")
                            .bold()
                            .font(.body)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        HStack{
                            Image(systemName: campSite.favorite ? "star.fill" : "star")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    campSite.favorite.toggle()
                                    try? context.save()
                                }
                            Link("予約はこちら", destination: URL(string: "\(campSite.url!)")!)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }){
                    NavigationLink(destination: DetailView(campSite: campSite)){
                        HStack{
                            Image(campSite.image!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            VStack(alignment: .leading) {
                                Text("評価：\(campSite.review,specifier: "%.1f")")
                                switch selectedData.month{
                                case 1:
                                    Text("1月最低気温：\(campSite.januaryMin)℃")
                                    Text("1月最高気温：\(campSite.januaryMax)℃")
                                case 2:
                                    Text("2月最低気温：\(campSite.februaryMin)℃")
                                    Text("2月最高気温：\(campSite.februaryMax)℃")
                                case 3:
                                    Text("3月最低気温：\(campSite.marchMin)℃")
                                    Text("3月最高気温：\(campSite.marchMax)℃")
                                case 4:
                                    Text("4月最低気温：\(campSite.aprilMin)℃")
                                    Text("4月最高気温：\(campSite.aprilMax)℃")
                                case 5:
                                    Text("5月最低気温：\(campSite.mayMin)℃")
                                    Text("5月最高気温：\(campSite.mayMax)℃")
                                case 6:
                                    Text("6月最低気温：\(campSite.juneMin)℃")
                                    Text("6月最高気温：\(campSite.juneMax)℃")
                                case 7:
                                    Text("7月最低気温：\(campSite.julyMin)℃")
                                    Text("7月最高気温：\(campSite.julyMax)℃")
                                case 8:
                                    Text("8月最低気温：\(campSite.augustMin)℃")
                                    Text("8月最高気温：\(campSite.augustMax)℃")
                                case 9:
                                    Text("9月最低気温：\(campSite.septemberMin)℃")
                                    Text("9月最高気温：\(campSite.septemberMax)℃")
                                case 10:
                                    Text("10月最低気温：\(campSite.octoberMin)℃")
                                    Text("10月最高気温：\(campSite.octoberMax)℃")
                                case 11:
                                    Text("11月最低気温：\(campSite.novemberMin)℃")
                                    Text("11月最高気温：\(campSite.novemberMax)℃")
                                case 12:
                                    Text("12月最低気温：\(campSite.decemberMin)℃")
                                    Text("12月最高気温：\(campSite.decemberMax)℃")
                                default:
                                    Text("1月最低気温：\(campSite.januaryMin)℃")
                                    Text("1月最高気温：\(campSite.januaryMax)℃")
                                }
                                Text("メモ:\(campSite.memo!)")
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

//Text("1月最低気温：\(campSite.januaryMin)℃")
//Text("1月最高気温：\(campSite.januaryMax)℃")
//Text("2月最低気温：\(campSite.februaryMin)℃")
//Text("2月最高気温：\(campSite.februaryMax)℃")
//Text("3月最低気温：\(campSite.marchMin)℃")
//Text("3月最高気温：\(campSite.marchMax)℃")
//Text("4月最低気温：\(campSite.aprilMin)℃")
//Text("4月最高気温：\(campSite.aprilMax)℃")
//Text("5月最低気温：\(campSite.mayMin)℃")
//Text("5月最高気温：\(campSite.mayMax)℃")
//Text("6月最低気温：\(campSite.juneMin)℃")
//Text("6月最高気温：\(campSite.juneMax)℃")
//Text("7月最低気温：\(campSite.julyMin)℃")
//Text("7月最高気温：\(campSite.julyMax)℃")
//Text("8月最低気温：\(campSite.augustMin)℃")
//Text("8月最高気温：\(campSite.augustMax)℃")
//Text("9月最低気温：\(campSite.septemberMin)℃")
//Text("9月最高気温：\(campSite.septemberMax)℃")
//Text("10月最低気温：\(campSite.octoberMin)℃")
//Text("10月最高気温：\(campSite.octoberMax)℃")
//Text("11月最低気温：\(campSite.novemberMin)℃")
//Text("11月最高気温：\(campSite.novemberMax)℃")
//Text("12月最低気温：\(campSite.februaryMin)℃")
//Text("12月最高気温：\(campSite.februaryMax)℃")

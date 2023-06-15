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
//        NavigationView{
            List {
                ForEach(fetchRequest.wrappedValue, id: \.self) { campSite in
                    Section(header: HStack {
                        HStack {
                            Text("\(campSite.name!)")
                                .font(.title3)
                                .bold()
                                .background(.cyan)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: campSite.favorite ? "star.fill" : "star")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    campSite.favorite.toggle()
                                    try? context.save()
                                }
                        }
                    }){
                        NavigationLink(destination: DetailView(campSite: campSite)){
                            VStack(alignment: .leading) {
                                Text("url：\(campSite.url!)")
                                Text("評価：\(campSite.review,specifier: "%.1f")")
                                switch selectedData.month{
                                case 1:
                                    Text("1月最低気温：\(campSite.januaryMin)℃")
                                    Text("1月最高気温：\(campSite.januaryMax)℃")
                                case 2:
                                    Text("2月最低気温：\(campSite.februaryMin)℃")
                                    Text("2月最高気温：\(campSite.februaryMax)℃")
                                default:
                                    Text("1月最低気温：\(campSite.januaryMin)℃")
                                    Text("1月最高気温：\(campSite.januaryMax)℃")
                                }
                            }
                        }
                    }
                }
            }
//        }
    }
}

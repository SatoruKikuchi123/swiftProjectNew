
import SwiftUI



struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var selectedData: SelectedData
    
    let monthMin=["","januaryMin","februaryMin"]
    let monthMax=["","januaryMax","februaryMax"]
    let sortLabel=["寒くない順","暑くない順","評価が高い順","お気に入り順"]
    @State private var selectedSort = 0
    @State private var selectedMin = 0
    @State private var selectedMax = 30
    
    var body: some View {
        
        NavigationView(){
            VStack {
                HStack{
                    Text("月")
                    Picker(selection: $selectedData.month, label: Text("月")) {
                        ForEach(1...12, id:\.self) { index in
                            Text("\(index)月")
                        }
                    }
                    Text("最低")
                    Picker(selection: $selectedMin, label: Text("最低")) {
                        ForEach(-25...25, id:\.self) { index in
                            Text("\(index)℃")
                        }
                    }
                    Text("最高")
                    Picker(selection: $selectedMax, label: Text("最高")) {
                        ForEach(0...35, id:\.self) { index in
                            Text("\(index)℃")
                        }
                    }
                }
                HStack{
                    Text("ソート")
                    Picker(selection: $selectedSort, label: Text("ソート")) {
                        ForEach(0...3, id:\.self) { index in
                            Text(sortLabel[index])
                        }
                    }
                }
                // キャンプ場一覧表示View
                CampSiteList(monthMin:monthMin[selectedData.month],
                             min: Int16(selectedMin),
                             monthMax:monthMax[selectedData.month],
                             max:Int16(selectedMax),
                             sortKey: Int16(selectedSort)
                )
            }
        }
        
        .onAppear {
            // Listビュー表示時に初期データ登録処理を実行
            registSampleData(context: context)
        }
    }
}

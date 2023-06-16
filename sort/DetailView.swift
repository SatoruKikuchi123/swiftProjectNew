//
//  DetailView.swift
//  sort
//
//  Created by user on 2023/06/15.
//

import SwiftUI
import MapKit
struct DetailView: View {
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var selectedData:SelectedData
    @State private var content: String
    private var campSite:CampSite
    @State private var region = MKCoordinateRegion(
        //Mapの中心の緯度経度
        center: CLLocationCoordinate2D(latitude: 35.45669724936197,
                                       longitude: 137.66726801214264),
        //表示領域の縮尺
        span: MKCoordinateSpan(latitudeDelta: 2,
                               longitudeDelta: 2)
    )
    init(campSite:CampSite){
        self.campSite=campSite
        self.content=campSite.memo ?? ""
    }
    
    var body: some View {
        VStack{
            Image(campSite.image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
            //                .frame(width: 100, height: 100)
            //                .clipShape(Circle())
                .shadow(radius: 10)
            List{
                Section(header: HStack {
                    HStack {
                        Text("\(campSite.name!)")
                            .font(.headline)
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
                        Link("予約", destination: URL(string: "\(campSite.url!)")!)
                        
                    }
                }){
                    Text("評価：\(campSite.review,specifier: "%.1f")")
                    HStack{
                        Text("メモ：")
                        TextField("メモ内容", text: $content)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    
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
                    Text("緯度：\(campSite.ido)")
                    Text("経度：\(campSite.keido)")

                    let place = [IdentifiablePlace(lat: campSite.ido, long: campSite.keido)]
                    Map(coordinateRegion: $region,
                        //Mapの操作の指定
                        interactionModes: .all,
                        //現在地の表示
                        showsUserLocation: true,
                        //マーカの指定
                        annotationItems: place)
                    { place in
                        MapAnnotation(coordinate: place.location) {
                            Image(systemName: "tent.2.circle")
                                .font(.title2)
                                .background(Color.orange.cornerRadius(15))
                        }
                    }
                    .task(){
                        //位置情報へのアクセスを要求
                        let manager = CLLocationManager()
                        manager.requestWhenInUseAuthorization()
                    }
                    .frame(width: 500, height: 300)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {saveCampSite()}){
                    Text("保存")
                }
            }
        }
    }
    private func saveCampSite(){
        campSite.memo=content
        try? context.save()
    }
}

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}




//                    Text("1月最低気温：\(campSite.januaryMin)℃")
//                    Text("1月最高気温：\(campSite.januaryMax)℃")
//                    Text("2月最低気温：\(campSite.februaryMin)℃")
//                    Text("2月最高気温：\(campSite.februaryMax)℃")
//                    Text("3月最低気温：\(campSite.marchMin)℃")
//                    Text("3月最高気温：\(campSite.marchMax)℃")
//                    Text("4月最低気温：\(campSite.aprilMin)℃")
//                    Text("4月最高気温：\(campSite.aprilMax)℃")
//                    Text("5月最低気温：\(campSite.mayMin)℃")
//                    Text("5月最高気温：\(campSite.mayMax)℃")

//                        Text("6月最低気温：\(campSite.juneMin)℃")
//                        Text("6月最高気温：\(campSite.juneMax)℃")
//                    Text("7月最低気温：\(campSite.julyMin)℃")
//                    Text("7月最高気温：\(campSite.julyMax)℃")
//                    Text("8月最低気温：\(campSite.augustMin)℃")
//                    Text("8月最高気温：\(campSite.augustMax)℃")
//                    Text("9月最低気温：\(campSite.septemberMin)℃")
//                    Text("9月最高気温：\(campSite.septemberMax)℃")
//                    Text("10月最低気温：\(campSite.octoberMin)℃")
//                    Text("10月最高気温：\(campSite.octoberMax)℃")
//                    Text("11月最低気温：\(campSite.novemberMin)℃")
//                    Text("11月最高気温：\(campSite.novemberMax)℃")
//                    Text("12月最低気温：\(campSite.decemberMin)℃")
//                    Text("12月最高気温：\(campSite.decemberMax)℃")

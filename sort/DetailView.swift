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
    let place = [IdentifiablePlace(lat: 35.335174239514004, long: 136.87209682640605)]
    @State private var region = MKCoordinateRegion(
        //Mapの中心の緯度経度
        center: CLLocationCoordinate2D(latitude: 35.3416028,
                                       longitude: 136.8706729),
        //緯度の表示領域(m)
        latitudinalMeters: 2000,
        //経度の表示領域(m)
        longitudinalMeters: 2000
    )
    
    init(campSite:CampSite){
        self.campSite=campSite
        self.content=campSite.memo ?? ""
    }
    
    var body: some View {
        VStack{
            List{
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
                        Text("メモ：\(campSite.memo!)")
                    }
                }
            }
            Map(coordinateRegion: $region,
                //Mapの操作の指定
                interactionModes: .all,
                //現在地の表示
                showsUserLocation: true,
                //マーカの指定
                annotationItems: place)
            { place in
                MapAnnotation(coordinate: place.location) {
                    Image(systemName: "tortoise.fill")
                        .foregroundColor(Color(UIColor.systemBackground))
                        .padding()
                        .background(Color.orange.cornerRadius(10))
                }
            }
            .task(){
                //位置情報へのアクセスを要求
                let manager = CLLocationManager()
                manager.requestWhenInUseAuthorization()
            }
            TextEditor(text: $content)
                .font(.body)
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

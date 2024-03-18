//
//  BannerCell.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 17/03/2024.
//

import SwiftUI

struct BannerCell: View {
    let banner : Banner
    var body: some View {
        if let image = banner.image , let url = URL(string: image) {
            
                        AsyncImage(url: url,transaction: .init(animation: .bouncy(duration: 1))) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            case .failure(let error):
                                placeHolder()
                                    .overlay {
                                        Text(error.localizedDescription)
                                            .foregroundStyle(.blue)
                                            .bold()
                                            .lineLimit(1)
                                    }
                            @unknown default:
                                EmptyView()
                            }// end of switch
                        }
                        .frame(width: 360 , height: 230)
                        .cornerRadius(10)
                        .background(Color(.systemBackground))
        }else{
            placeHolder()
        }
    }
}

#Preview {
    BannerCell(banner: .init(id: nil, image: nil, category: "aclsc", product: "ajkdcnkjadcnjka"))
}

//private func HorizontalCell(banners : Banner) -> some View{
//    if let image = banners.image , let url = URL(string: image) {
//        
//                    AsyncImage(url: url,transaction: .init(animation: .bouncy(duration: 1))) { phase in
//                        switch phase {
//                        case .empty:
//                            ProgressView()
//                        case .success(let image):
//                            image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                        case .failure(let error):
//                            placeHolder()
//                                .overlay {
//                                    Text(error.localizedDescription)
//                                        .foregroundStyle(.blue)
//                                        .bold()
//                                        .lineLimit(1)
//                                }
//                        @unknown default:
//                            EmptyView()
//                        }// end of switch
//                    }
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(10)
//                    .background(Color(.systemBackground))
//    }else{
//        placeHolder()
//    }
//}

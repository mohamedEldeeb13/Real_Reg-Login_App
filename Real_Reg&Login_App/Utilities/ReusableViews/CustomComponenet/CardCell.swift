//
//  CardCell.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 17/03/2024.
//

import SwiftUI

struct CardCell: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading){
            if let image = product.image , let url = URL(string: image){
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
                
                VStack(alignment: .center){
                    Text(product.name ?? "")
                        .font(.system(size: 18, weight: .bold, design: .default))
                    Text("Price: \(String(format: "%.2f", arguments: [product.price ?? 0.0]))")
                        .font(.system(size: 14, weight: .regular, design: .default))
                }
                .padding(.leading, 3)
                .padding(.bottom, 6)
                .lineLimit(0)
                
            }else{
                placeHolder()
            }
        }
        .frame(width: 160, height: 170)
        .background()
        .cornerRadius(12)
        .shadow(radius: 2)
        
    }
}

#Preview {
    CardCell(product: .init(id: nil, price: 234, oldPrice: nil, discount: nil, image: "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg", name: "iphone 12", description: "", images: nil, inFavorites: nil, inCart: nil))
}

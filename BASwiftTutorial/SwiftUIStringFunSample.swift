

import SwiftUI





struct SwiftUIStringFunSample: View {
    
    //1. sorunun stateleri
    @State var name:String = ""
    @State var result : Int = 0
    
    //2. sorunun stateleri
    @State var nameSample : String = ""
    @State var nameCharCount : String = ""
    @State var nameCountResult : String = ""
    
    //3. sorunun stateleri
    @State var productName : String = ""
    @State var productResult : String = ""
    
    //4. sorunun stateleri
    @State var ad : String = ""
    @State var soyad : String = ""
    @State var fullAd :String = ""
    
    //Ödev 5. soru
    @State var soru5: String=""
    @State var resultSoru5 : String = ""
    
    //bu function dışarıdan bir metin alır. Metnin soluna TR işareti koyup metni büyülttükten sonra metni geriye döner
    func nameOperation(name:String)-> String{
        
        let nameOperationResult = "TR - " + name;
        
        return nameOperationResult.uppercased()
    }

    
    
    func nameSurnameOp(name:String,surname:String) -> String{
        
        let nameLastIndex = name.index(before: name.endIndex)
        let surnameLastIndex = surname.index(before: surname.endIndex)
        
        let nameLastChar = name[nameLastIndex].uppercased()
        let surnameLastChar = surname[surnameLastIndex].uppercased()
        
        //herhangi bir metnin son harf hariç kalanını bana ver. Çağatay -> Çağata
        let nameRange = name.startIndex..<name.index(name.endIndex, offsetBy: -1)
        let surnameRange = surname.startIndex..<surname.index(surname.endIndex, offsetBy: -1)
        
        
        
        let nameSurnameResult = name[nameRange].lowercased() + nameLastChar + " " + surname[surnameRange].lowercased()  + surnameLastChar
        
        return  nameSurnameResult;
        
    }

    
    
    
    var body: some View {
        
        //Ödev-5Ekrana 1 text field ve buton koy. Butona tıklandığında girilen metnin bir harfi büyü diğer harfi küçük şeklinde yazsın.
        
        VStack{
            
            TextField("Data:",text:$soru5)
                .padding()
            
            Button("Calc"){
                
                 
                var sayac = 0;
                for element in soru5{
                    
                    if sayac % 2 == 0{
                        resultSoru5 = resultSoru5 +  element.lowercased()
                    }
                    else{
                        resultSoru5 = resultSoru5 + element.uppercased()
                    }
                    
                    sayac = sayac + 1
                    
                }
                
                
                
            }
            
            Text(resultSoru5)
            
            
        }
        
        
        
        //Soru - 1Ekrana bir textfield bir buton ve sonucu göstereceğin text koy. Butona tıkladığında textfield a girilen metnin kaç karakter olduğunu Text e yazsın
        VStack{
            
            TextField("Name:", text:$name)
                .padding()
            
            Button("Get Count"){
                result = name.count
            }
            
            Text(String(result))
            
            
        }
        
        //Ekrana 2 textfield bir buton ve sonucu göstereceğin bir text koy. Birinci textfield a metin girilecek 2. textfield a ise number girilecek. Girilen number değeri kadar metin karakteri alınsın. Aynı zamanda büyük harf gösterilsin. Örneğin Çağatay, 2 girdiğinde sonuç ça olur
        
        VStack{
            TextField("Name:", text:$nameSample)
                .padding()
            
            TextField("Count:", text:$nameCharCount)
                .padding()
            
            Button("Name Result"){
                
                let count = Int(nameCharCount)
                
                let range = nameSample.startIndex ..< nameSample.index(nameSample.startIndex, offsetBy: count!)
                
                nameCountResult = String(nameSample[range]).uppercased()
                
                
            }
            
            Text(nameCountResult)
                .padding()
            
            
        }
        
        
        //Bir textfield, sonuc için bir text ve bir buton koy. Butona tıkladığında textfield dan aldığı değerin soluna TR- eklesin aynı zamanda tüm harfleri büyültsün. AMA BUNU BİR FONKSİYONLA YAZ
        
        VStack{
            
            TextField("Product Name: ", text:$productName)
                .padding()
            
            Button("Result"){
                productResult = nameOperation(name: productName)
                
            }
            .padding()
            
            Text(productResult)
                .padding()
            
            
        }
        
        //Ekrana 2 textfield (name-surname) bir buton ve bir text koy. Butona tıkladığında textfieldlardaki son harfler büyük yazılsın (çağataY yıldıZ gibi) ve textte sonucu görelim.
        
        VStack{
            
            TextField("Ad:",text:$ad)
                .padding()
            
            TextField("Soyad:", text:$soyad)
                .padding()
            
            Button("Birleştir"){
                fullAd = nameSurnameOp(name: ad, surname: soyad)
                
            }
            
            Text(fullAd)
            
            
        }
        

        
        

        
        
    
    }
    
}

struct SwiftUIStringFunSample_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStringFunSample()
    }
}

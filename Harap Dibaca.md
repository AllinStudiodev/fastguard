# fastguard

Aplikasi Patroli untuk Fastech

# Incident

### incident_repository
    folder yang berfungsi sebagai tempat penyimpanan insiden

### incident_repository.dart
    file barrel untuk kemudahan export file

### incident_entity.dart
    IncidentEntity merepresentasikan struktur koleksi incident yang ada di firestore
    class ini extent equatable untuk membandingan dua objek yang berbeda instance
    https://pub.dev/packages/equatable
    toJson formJson untuk konversi ke json, karena objek dart harus dikonversikan ke json format sebelum bisa dibaca firestore
    toDocument formSnapshot spesifik untuk firestore 

### incident_model.dart
    model berisi plain dart class, memisahkan entitas dan model berguna ketika kita switch data provider, jadi hanya ganti toEntity dan from Entity dari model layer

### firebase_incident_repository.dart
    berisi kueri untuk mengintergrasikan aplikasi kita dengan firebase



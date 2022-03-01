import 'dart:io';
import 'package:dart_shp/dart_shp.dart';

void main() async {
  //print('Hello world!');

  //read shapefile
  var settlementShp = File('./geodata/settlements.shp');
  var reader = ShapefileFeatureReader(settlementShp);
  String fGeomType = "";
  await reader.open();

  while (await reader.hasNext()) {
    Feature feature = await reader.next();

    var fAttributes = feature.attributes;
    var fCoord = feature.geometry!.getCoordinate();

    //Get Shapefile Geometry type
    fGeomType = feature.geometry!.getGeometryType();

    var latitude = fCoord?.y;
    var longitude = fCoord?.x;

    print(
        "Latitude: $latitude, Longitude: $longitude, Properties: $fAttributes");
  }

  print("Geometry Type: $fGeomType");

  reader.close();
}

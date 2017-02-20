Reverse Geo-coding - Get address from latitude and longitude

### Source code to retrieve address from Latitude and Longitude

```swift
func reverseGeocodeLocation(location: CLLocation) {
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
        if error != nil {
            print("Reverse geocoder failed with error \(error!.localizedDescription)")
        }
        if (placemarks?.count)! > 0 {
            let pm = placemarks![0]
            if let country = pm.country {
                print("Country is \(country)")
            }
        } else {
            print("Reverse geocoder failed")
        }
    })
}
```

#### Address components

Above code has country component, which you can replace with any of followings.

##### Name of location

```swift
if let country = pm.name {
    print("name is \(name)")
}
// eg. Apple Inc.
```
                 
##### Name of Street name

```swift
if let thoroughfare = pm.name {
    print("thoroughfare is \(thoroughfare)")
}
// street name, eg. Infinite Loop
```
              
##### Number of Street

```swift
if let subThoroughfare = pm.subThoroughfare {
    print("subThoroughfare is \(subThoroughfare)")
}
// subThoroughfare, eg. 1
```

##### City

```swift
if let locality = pm.locality {
    print("locality is \(locality)")
}
// city, eg. Cupertino
```
             
##### District

```swift
if let subLocality = pm.subLocality {
    print("subLocality is \(subLocality)")
}
// neighborhood, common name, eg. Mission District
```
             
##### State

```swift
if let administrativeArea = pm.administrativeArea {
    print("administrativeArea is \(administrativeArea)")
}
// state, eg. CA
```
             
##### County

```swift
if let subAdministrativeArea = pm.subAdministrativeArea {
    print("subAdministrativeArea is \(subAdministrativeArea)")
}
// county, eg. Santa Clara
```
             
##### Zip Code

```swift
if let postalCode = pm.postalCode {
    print("postalCode is \(postalCode)")
}
// zip code, eg. 95014
```

##### ISO Country Code

```swift
if let isoCountryCode = pm.isoCountryCode {
    print("isoCountryCode is \(isoCountryCode)")
}
// eg. US
```

##### Full Country name

```swift
if let country = pm.country {
    print("country is \(country)")
}
// eg. United States
```
             
##### Inland water

```swift
if let inlandWater = pm.inlandWater {
    print("inlandWater is \(inlandWater)")
}
// eg. Lake Tahoe
```

##### Ocen

```swift
if let ocean = pm.ocean {
    print("ocean is \(ocean)")
}
// eg. Pacific Ocean
```
             
##### Areas of interest

```swift
if let areasOfInterest = pm.areasOfInterest {
    print("areasOfInterest is \(areasOfInterest)")
}
// eg. Golden Gate Park
```
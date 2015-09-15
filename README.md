
### Spinlister iOS Coding Challenge
#### Episode 1 -- Estimated Time 3-6 hours

This challenge involves using a provided generator class to 'fetch' and render n sets of coordinates on a map.

The candidate will ingest fetched data and render up to a maximum of n annotations on a dynamic and traversable map.

###### Notes

- Spinlister currently uses Realm to persist all data.
- If an approach seems too simple, feel free to open and/or maintain a line of dialogue with us.

##### The Data

The generator will accept a set of latitude and longitude coordinates and the viewport radius in meters in the following form:

```
// + (NSArray *)coordinatesForLatitude:(double)latitude longitude:(double)longitude radius:(double)radius;

NSArray *coordinates = [SLDataGenerator coordinatesForLatitude:latitude longitude:longitude radius:radius];
```

The generator will yield an NSArray of latitudes and longitudes in the following format (represented here as json):

```
[
	[0.0000,0.0000],
	[38.001212,-76.12113],
	...
]
```

- The generator will yield only a subset of the total coordinate pairs.
- The generator will yield a set of coordinate pairs that only exist within the provided map viewport (lat/lng/radius).
- The generator is intended to act as a mock of a remote web service. Accordingly it should be treated as separate from the app as a whole.

##### The Requirements

###### Meta

- The candidate will create a simple single page app that conforms to best known practices for objective-c.
- The candidate will create any and all UI/UX elements using programmatic methods, not nibs or storyboards.
- The candidate will be expected to give due thought to the approach of the app, including but not limited to any architecture, code separation, or performance components.

- The candidate will properly comment and/or explain complex code. Especially in the case the code was used from a source other than their own brain.

- The candidate may use any third party libraries they deem necessary, except for any that perform the expected function of this exercise (dont cheat).

##### The Implementation

- The candidate will create a pan-and-zoom-able map.
- The candidate will implement a set of classes that fetches data from the provided SLDataGenerator class.
- The candidate will implement a set of classes that renders coordinate data as annotations on the map.

- The candidate should implement a solution to efficiently store and retrieve annotation data for rendering on the map.
- The candidate should allow the solution to perform one or more fetches while panning or zooming the map.

###### Plus One of the below

- The candidate might persist all points in a database.

####### 1

- The candidate might perform location tagging and relocate based on a search feature.

####### 2

- The candidate might perform grouping of clustered locations.

####### 3

- The candidate might contrive a similar example, define their own requirements, and present a prototype. Keep in the mind the recommended time constraints.

###### Constraints

- The candidate should view the generator as a hostile object.
- The candidate should not expect the generator to provide data in a reliable, consistent, or timely manner.
- The candidate should keep a minimum number of annotations stored on the map.

- The candidate may modify the generator object, provided that changes are documented and justified.

###### Recommended but Bonus (Optional)

- The candidate might handle low memory notifications accordingly.

- The candidate might submit the project via github.
- The candidate might commit code as if in a production environment.

- The candidate might create a set of unit tests that cover any smoke or edge cases the candidate can imagine and feasibly encode.
- The candidate might create a set of ui/ux tests that cover any smoke or edge cases the candidate can imagine and feasibly encode. (XCode 7 unless a masochist)


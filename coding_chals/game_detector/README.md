### Instructions
- choose ruby, python or javascript
- implement what is requested
- write tests to validate
- send in compressed: implementation, compressed, notes, comments

### Input
- hash/object of GameIds and arrays of how those games may be referenced
- large body of documents, array of strings to be scanned

### Output
- document of strings now tagged with GameId and original reference

### Additional
- explain work and be able to comment on running time

---

#### Initial Thoughts
- this seems simple, but isn't, there are many common words in these phrases
- uppercase/lowercase distinctions

- possibly using keywords derived from the mapping as ways to search out phrases, since "the last Destiny" collides with many other "the last..." phrases

- scan each string line, quickly key into certain words that assure game reference (possible matches)
- possibly(?) split strings along commas and periods, how likely that a game name will go across?
- send any string that gets a match to a helper method that takes that individual string and scans it for the closest match to the n-grams given

##### Research n-grams

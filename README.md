# Futbul


## Project Description


```For the Futbol project, we will be utilizing data from a fictional soccer
league to analyze team performance across specific seasons and across all
seasons. This will be done for individual teams and the league as a whole.
```

## Organization

```
The Futbol project was organized in a manner in which one class is not
responsible for all of the methods. We broke up the methods based off of what
it was evaluating. We created Game Statistics, League Statistics, Season
Statistics and Team Statistics. Each of these classes are responsible for
evaluating information from the given CSV files. Our StatTracker class is solely
 responsible for executing the methods that were created.
```

## Testing

```
Testing was conducted with different approaches. For the development of our
methods, we utilized fixtures, the fixtures were created by importing data
from the Game, GameTeams and Teams CSV files. This allowed our testing to
perform its basic function which is to determine if the method gave us the
information we needed. Using fixture files also allowed the testint times to
 be reduced from over 60 seconds to under 5 seconds when we run our rake file.
 Additionally, we utilized the Futbol Spec Harness to ensure that our methods
 were passing our main project requirements.
```



## Schema

```
The image below is a visual representation of our project and the
dependencies/relationships within.  
```

![alt text](schema.png "Logo Title Text 1")

# CSC 510 Software Engineering HW2 GROUP-4

[![Build Status](https://travis-ci.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4.svg?branch=master)](https://travis-ci.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4) <a href="https://doi.org/10.5281/zenodo.3995130"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.3995130.svg" alt="DOI"></a>

This repository is part of CSC 510 Software Engineering HW2 and HW3. It contains the [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) implementation in Julia, Ruby and Scala.

For quick navigation, use the following links,
- [Julia](https://github.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4/tree/master/Julia) contains the code for Game of Life written in Julia.
- [Ruby](https://github.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4/tree/master/Ruby) contains the code for Game of Life written in Ruby.
- [Scala](https://github.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4/tree/master/Scala) contains the code for Game of Life written in Scala.


## Game of Life
The game consists of a grid where in each cell value represents if the cell is alive or dead.
<br>
1 -> Alive
<br>
0 -> Dead

The game has 3 tunable parameters:
  - Grid size
  - Number of cells alive
  - Generations
  
The output will be the grid after guven number of generations based on following rules,

     C   N                 new C
     1   0,1             ->  0  // Lonely
     1   4,5,6,7,8       ->  0  // Overcrowded
     1   2,3             ->  1  // Lives
     0   3               ->  1  // It takes three to give birth!
     0   0,1,2,4,5,6,7,8 ->  0  // Barren

## Execution Instructions
1. Our execution will ensure that each member will spend 10 minutes on each language.
2. All the codes will be debugged using online compiler.
3. Go to [Script](https://github.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4/tree/master/Script.md) to begin the experiment!

## Observations
Manual bservations will be noted down in Excel Sheet and participants wold also fill a Google Form.
Analysis of data collected can be found in [RESULT.md](https://github.com/bhoomi2807/NCSU_CSC-510_SE_HW2_GROUP-4/blob/master/RESULTS.md)


### Things to note down:
  - Bug found?
  - Bug resolved?
  - Time taken for above actions
  - Issues faced if any while downloading/compiling code
  
### Questions to ask:
  - Familiarity with language before today.
  - Familiarity with language after spending 10min.
  - Review for the code written. (easily understandable/could be better/not understandable)
  - Review for coding language. (very easy/moderate/hard to code)

## Group 4 Details:
1. [Alisha Shahane](mailto:asshahan@ncsu.edu) (asshahan)<br>
2. [Shruti Kangle](mailto:sskangle@ncsu.edu) (sskangle)<br>
3. [Bhoomi Shah](mailto:bshah2@ncsu.edu) (bshah2)<br>
4. [Poorva Kulkarni](mailto:pnkulkar@ncsu.edu) (pnkulkar)<br>
5. [Rohan Pillai](mailto:rspillai@ncsu.edu) (rspillai)<br>

# Questions from README

####`get_all_olympic_athletes(filename)`
_1. Before reading the test file, write down a description of 2 test cases that test the core functionality, and are nominal tests._

    Positive nominal tests:
    A. Check to access a single category (ex: `[123]["ID"].class == Integer`) 
    B. Check that the length of each hash 
    
1. Read through the tests in `test/csv_practice_test.rb`.
    - How did we "Assert" and check that the method returns an array of hashes?
        + Checked to see if the returned object was an array.
    - How did we "Assert" and check that the method returns an array of hashes with the correct keys?
        + Checked each field matched the string in the constant array holding each column label.
    - How did we "Assert" and check that the method returns an accurate list of Olympic medalists?
        + Check that the length of the returned array from the read file is of the correct length (49503)
        + Check for the correct data in the first and last rows
    - What nominal tests did we miss?
        + Check a random row in the middle of the CSV
1. Write down descriptions of 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)


    A. Any nil entries in the CSV
    B. Any other garbage rows in the CSV (ex: invalid city names, invalid ID #s, invalid games

1. TDD the implementation of `get_all_olympic_athletes(filename)` with the provided tests.
(In other words, given the tests have already been written for you, write the method to get all tests to pass.)

    `When calling CSV.read, consider what the relative path of the csv file from the file the code is in`

______________________________________________

####`total_medals_per_team(olympic_data)`

1. Write descriptions for 2 test cases that test the core functionality, and are nominal tests.

    A. Check known medal totals for some teams (already included in test code...)
    B. Check that the returned data structure is a Hash
    C. Check that the value for the first and last keys are integers
    
1. Read through the tests in `test/csv_practice_test.rb`.
    - In the tests, how do we "Arrange" and setup the data of all Olympic athletes?
        + A hash with the team names as keys and medal counts as the values
    - How did we "Assert" and check that the method returns a hash?
        + expect(total_medals).must_be_instance_of Hash
    - How did we "Assert" and check that the method returns an accurate hash?
        + hard coded a hash with the known teams that have won medals and their medal count and compared values against the hash returned from total_medals_per_team
    - What nominal tests did we miss?
        + Hmm... I'm not sure. The hard-coded hash covers both negative and positive nominal cases pretty thoroughly...
        + I guess the hash length? There could be all the correct teams and counts, but additional teams that should not have been included
        + In that same vein, that the keys in the hash match the hard-coded hash EXACTLY.
    
1. Write descriptions for 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)

    A. Positive edge case: that the last team in the hash is included in the hardcoded hash.
    B. Negative edge case: that the medal count counts actual medals (ie "Gold", "Silver", "Bronze") and not some random string other than "NA".

1. TDD the implementation of `total_medals_per_team(olympic_data)` with the provided tests.

__________________________________________________________________________
#### `get_all_gold_medalists(olympic_data)`

1. Write descriptions for 2 test cases that test the core functionality, and are nominal tests.

    A. Check that the returned data structure is an array
    B. Check that each element of the array is a hash

1. Read through the tests in `test/csv_practice_test.rb`.
    - In the tests, how do we "Arrange" and setup the data of all Olympic athletes?
        + use the first method `get_all_olympic athletes` to have an array of hashes.
    - How did we "Assert" and check that the method returns an array of hashes?
        + iterate through the outer array to check that each element is a hash
    - How did we "Assert" and check that the method returns an accurate list of only gold medalists?
        + iterate through outer array and access `:"Medal"` for each hash and checked if == "Gold"
    - What nominal tests did we miss?
        + array length
        + check of list of team names against hard-coded list of known gold medal teams/athletes
        + Negative nominal edge: check for known output for nil entries
    
1. Write descriptions for 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)

    A. Positive edge: run `.sort` and check if first and last elements `.must_equal` known values
    B. check team or athlete name against hard-coded list of known gold medal teams/athletes

1. TDD the implementation of `get_all_gold_medalists(olympic_data)` with the provided tests.
1. If your working implementation did not use the method `filter`, refactor to use `filter` now.

__________________________________________________________________________
###  Optionals:

####`team_with_most_medals(medal_totals)` 

1. Come up with 2 test cases that test the core functionality, and are nominal tests.

    A. Confirm the returned data structure is a Hash.
    B. Well.. I didn't like the specification for `team_with_most_medals(medal_totals)` so I ignored the specification for `hash.length = 2`, to be consistent with the rest of the program and I had `hash.length = 1`, such that `{team => medal_count}`. But testing the hash length.

1. Come up with 2 edge test cases.
   
   Note: NOT IMPLEMENTED 
    A. Positive edge: test the medal count of the first and last teams (after sorting)
    B. Negative edge case: that the medal count counts actual medals (ie "Gold", "Silver", "Bronze") and not some random string other than "NA".  (as with `total_medals_per_team`)
    
1. TDD the implementation.
1. Refactor. If you didn't, consider how you could use `map` or `sort` in your solution.

####  `athlete_height_in_inches(olympic_data)`

1. Come up with 2 test cases that test the core functionality, and are nominal tests.

   A. Test that the returned data structure is an array
   B. Test that each element is a Hash
   C. Test that the value for each height is either a float or "NA"

1. Come up with 2 edge test cases.

   Note: NOT IMPLEMENTED 
    A. Positive edge: consider the margin of error passed to `.must_be_close_to`
    B. Positive edge: consider  0cm heights
    C. Negative edge: Consider negative cm heights
    E. Negative edge: Consider non-integer heights aside from "NA"
    
1. TDD the implementation.
1. Refactor. If you didn't, consider how you could use `map` or `sort` in your solution.

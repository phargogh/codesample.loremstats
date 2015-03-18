Analysis of Randomized Text
===========================

Prerequisites:
  * Mac version of md5 (if you're running it on linux,
      you may need to touch up line 23 of make_data.sh to use the correct program)
  * ruby
  * bash

To create the sample data directory, run:

    ./make_data.sh

Goal:
Write a program for use by a scientist that will take a directory tree
(such as what `make_data.sh` will generate) and aggregate some statistics from the
data files contained throughout the tree.

Particular statistics to aggregate:
  * How many text strings are 5-letter words with at least 2 vowels?
  * What are the min/max/mean character counts for each text file?

Ideally, we'd like to be able to point this program at an arbitrary directory and
have it able to run the same statistics on that. The final program should be run
by the scientist at the command-line and should generate the above stats given
the text files in a directory tree.

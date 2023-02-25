include std/unittest.e

include yacht.ex

test_equal("Yacht",score({5,5,5,5,5},"yacht"),50)
test_equal("Not Yacht",score({1,3,3,2,5},"yacht"),0)
test_equal("Ones",score({1,1,1,3,5},"ones"),3)
test_equal("Ones, out of order",score({3,1,1,5,1},"ones"),3)
test_equal("No ones",score({4,3,6,5,5},"ones"),0)
test_equal("Twos",score({2,3,4,5,6},"twos"),2)
test_equal("Fours",score({1,4,1,4,1},"fours"),8)
test_equal("Yacht counted as threes",score({3,3,3,3,3},"threes"),15)
test_equal("Yacht of 3s counted as fives",score({3,3,3,3,3},"fives"),0)
test_equal("Fives",score({1,5,3,5,3},"fives"),10)
test_equal("Sixes",score({2,3,4,5,6},"sixes"),6)
test_equal("Full house two small, three big",score({2,2,4,4,4},"full house"),16)
test_equal("Full house three small, two big",score({5,3,3,5,3},"full house"),19)
test_equal("Two pair is not a full house",score({2,2,4,4,5},"full house"),0)
test_equal("Four of a kind is not a full house",score({1,4,4,4,4},"full house"),0)
test_equal("Yacht is not a full house",score({2,2,2,2,2},"full house"),0)
test_equal("Four of a Kind",score({6,6,4,6,6},"four of a kind"),24)
test_equal("Yacht can be scored as Four of a Kind",score({3,3,3,3,3},"four of a kind"),12)
test_equal("Full house is not Four of a Kind",score({3,3,3,5,5},"four of a kind"),0)
test_equal("Little Straight",score({3,5,4,1,2},"little straight"),30)
test_equal("Little Straight as Big Straight",score({1,2,3,4,5},"big straight"),0)
test_equal("Four in order but not a little straight",score({1,1,2,3,4},"little straight"),0)
test_equal("No pairs but not a little straight",score({1,2,3,4,6},"little straight"),0)
test_equal("Minimum is 1, maximum is 5, but not a little straight",score({1,1,3,4,5},"little straight"),0)
test_equal("Big Straight",score({4,6,2,5,3},"big straight"),30)
test_equal("Big Straight as little straight",score({6,5,4,3,2},"little straight"),0)
test_equal("No pairs but not a big straight",score({6,5,4,3,1},"big straight"),0)
test_equal("Choice",score({3,3,5,6,6},"choice"),23)
test_equal("Yacht as choice",score({2,2,2,2,2},"choice"),10)

test_report()

# if get issue with grep getting "binary file matches"
cat test.log | tr -d '\000' | grep GET test.log

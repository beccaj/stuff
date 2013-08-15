cd /src/sales_board

echo "beginning"
# echo "beginning" > ../RESULTS

# for f in $(find test -name "*test.rb"); do 
for f in $(find test/functional/ -name "*test.rb"); do
# for f in $(find test -wholename "test/unit/call_test.rb"); do 
  RET=1
  echo "Testing: $f"
  # echo "Testing: $f" >> ../RESULTS

  until [ ${RET} -eq 0 ]; do
    ruby -Itest $f 2> ../DELETE 
    RET=$?
  done
done


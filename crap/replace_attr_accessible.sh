cd /src/sales_board
for f in $(find . -name "*.rb"); do
# for f in $(find . -wholename "*app/models/user.rb"); do
  sed -i 's/attr_accessible/# attr_accessible/g' "$f"
  echo $f
done
echo "this is a test of test file" > test.txt
sed -i 's/test/trial/' test.txt
cat test.txt
rm test.txt

echo "the brown fox jumps over the lazy dog" > aaa.txt
sed -e 's/fox/elephant/g' -e  's/dog/cat/g' aaa.txt
cat  aaa.txt
rm aaa.txt


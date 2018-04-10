#S1
#converting pdf file to text file
pdftotext -layout result_MDL.pdf s1results.txt
#retrieving records of CS students and storing it in aaa.txt
grep -A 2 "MDL16CS" s1results.txt | paste>aaa.txt
#deleting the first line which tells the field names of students list of C4B 
sed '1d' c4b.txt>C4B.txt
#deleting all newline characters of aaa.txt and storing it in bbb.txt
tr -d ' \n\t\r' <aaa.txt | paste>bbb.txt
#creating a format for bbb.txt
sed -i 's/MDL/\nMDL/g' bbb.txt
sed -i 's/MA101/\tMA101/g' bbb.txt
sed -i 's/,/ /g' bbb.txt
#replacing all grades with grade points
sed -i 's/(O)/ 10 /g ; s/(A+)/ 9 /g ; s/(A)/ 8.5 /g ; s/(B+)/ 8 /g ; s/(B)/ 7 /g ; s/(C)/ 6 /g ; s/(P)/ 5 /g ; s/(F)/ 0 /g ; s/(E)/ 0 /g ; s/(I)/ 0 /g' bbb.txt
#calculating sgpa of S1 and storing it to s1.txt which has KTU-ID and sgpa of students of CS batch
awk '{sum=0; sum=sum + ($3*4 + $5*4 + $7*3 + $9*3 + $11*3 + $13*3 + $15*1 + $17*1 + $19*1); {printf("%s %.2f\n",$1,sum/23);}}' bbb.txt>s1.txt
#S2
#repeating the same steps for calculating sgpa of S2
pdftotext -layout result_MDL2.pdf s2results.txt
grep -A 2 "MDL16CS" s2results.txt | paste>ccc.txt
tr -d ' \n\t\r' <ccc.txt | paste>ddd.txt
sed -i 's/MDL/\nMDL/g' ddd.txt
sed -i 's/CY100/\tCY100/g' ddd.txt
sed -i 's/,/ /g' ddd.txt
sed -i 's/(O)/ 10 /g ; s/(A+)/ 9 /g ; s/(A)/ 8.5 /g ; s/(B+)/ 8 /g ; s/(B)/ 7 /g ; s/(C)/ 6 /g ; s/(P)/ 5 /g ; s/(F)/ 0 /g ; s/(E)/ 0 /g ; s/(I)/ 0 /g' ddd.txt
awk '{sum=0; sum=sum + ($3*4 + $5*4 + $7*3 + $9*1 + $11*1 + $13*4 + $15*3 + $17*3 + $19*1); {printf("%s %.2f\n",$1,sum/24);}}' ddd.txt>s2.txt
#joining s1.txt and s2.txt on the basis of KTU-ID and storing it in eee.txt
join s1.txt s2.txt | paste>eee.txt
#calculating cgpa and storing it in fff.txt
awk '{sum=0; sum=sum + ($2 + $3); {printf("%s %.2f\n",$1,sum/2);}}' eee.txt>fff.txt
#joining C4B.txt and fff.txt on the basis of KTU-ID and storing it in ggg.txt
join -1 1 -2 6 fff.txt C4B.txt | paste>ggg.txt 
#ggg.txt now has the student details and cgpa of students of C4B
#selecting various fields from ggg.txt and storing it to final.txt
awk '{printf("%s\t%-9s %-12s %-11s   %-41.2f\n",$1,$8,$9,$10,$2);}' ggg.txt>final.txt
#adding the field names to the beginning of final.txt
sed -i '1s/^/\nKTU REG. NO            NAME                          CGPA\n/' final.txt
#display final.txt
cat final.txt
#removing unnecessary files
rm s1results.txt aaa.txt C4B.txt bbb.txt s1.txt s2results.txt ccc.txt ddd.txt s2.txt eee.txt fff.txt ggg.txt

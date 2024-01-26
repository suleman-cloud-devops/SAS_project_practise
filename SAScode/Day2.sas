/*If-else Conditional Statements*/
data class;
	set sashelp.class;

weightkg=weight*0.454;

heightm=(height*2.54)/100;

BMI=weightkg/(heightm*heightm);

if BMI<=18 then Status="Healthy weight";
else if BMI>18 and BMI<=21 then Status="overweight";
else if BMI>21 then Status="Obese";

run;
/*
>= represent as ge
<= represent as le
> represent as gt
< represent as lt
<> represent as ne
*/
/*Filtering Data*/
data class;
	set sashelp.class;  /*Data step where condition*/
where sex='F' and age>12;
run;

/*SAS Dates
All sas dates begin on 01-Jan-1960
31-Dec-2018 represent as 21549 which can be further represented as 31-Dec-18 or 12/31/2018
or 2018-12-31
d-should be kept after date input to convert it to numeric for Dates 
*/
data test;
a='1-jan-2018'd;
b='31-Dec-1960'd;
diff=a-b;
run;

/*SAS functions
There are 2 types of functions
1. Character function
	a.Upcase
	b.Lowcase
	c.Propcase
	d.Length
	e.CAT
2. Numberic Function
*/

data class1;
input fname :$7. lname :$10. gender $ class $;
cards;
Joe roghanjosh male HIST101
Mallika AroraKhan Female STAT102
Penny sebastine Male CIVI201
;

run;

data class2;
	set class1;
	
uname=upcase(fname);
lfname=lowcase(fname);
pfname=propcase(fname);
lenfname=length(fname);
fullname=cat(fname,lname);
run;

/*SAS Functions continued - 

Substr
Trim
Left
Strip
compress

*/

data class3;
	set class1;

course=substr(class,1,4);
fullname2=cat(trim(fname),lname); /*Trailing spaces will be removed*/ 
fullname3=cat(trim(left(fname)),lname);/*Leading spaces will be removed*/
fullname4=cat(strip(fname),lname);/*remove both leading and trailing spaces*/

run;

data test;
a="  United   States of America  ";
b=compress(a);/*remove all space in-between as well*/
c=strip(a);
d=compbl(a);/*remove morethan one space between words but kept only single space*/

run;

/*SAS Formats - Introduction
formatting: formatting is making a numeric value more meaningfull
*/
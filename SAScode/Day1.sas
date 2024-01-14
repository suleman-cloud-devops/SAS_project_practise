data patients;
input name $ gender $ age weight;
cards;
Raj M 39 56
rani F 31 55
roopa F 32 45
ravi M 29 60
;
run;

PROC IMPORT OUT= work.fnes
DATAFILE= "/home/u63542749/Practice/import.csv" 
            DBMS=csv 
            REPLACE;
       
       GETNAMES=YES;
RUN;

data class;
infile cards delimiter=',' dsd;
input Name :$14. Gender $ Age;
cards;
"Joe,Kelly",M,23
"Steve,Smith",M,32
"Perry,Alyesa",F,31
;
run;

/*Bringing Data into SAS Using Column Input*/
data myclass;
input name $1-7 gender $8 Age 9-10 Weight 11-17;
cards;
John   M23170.23
pearsonM32120.35
Mani   F25110.25
;
run;

/*Bringing Data into SAS Using column pointer @ symbol here @ used for position*/
data class;
input names $1-9 Age 10-11 Gender $ @21 weight ;
cards;
John     23 M       170.23
morrisonJ32 Female  180.34
Kate     54 F       120.22
;
run;


/*Bringing Data into SAS Using the line pointer # symbol*/
data myclass;
input fname :$14. lname $20.
#2 gender $
#3 age weight;
cards;
john Smith
Male 
23 107.23
jhonathanwheel amy
female
32 108.92
;
run;

/*Bringing Data into SAS Using line pointer slash symbol*/

data myclass;
input fname :$14. lname $20.
/ gender $ age weight;
cards;
john Smith
Male 23 107.23
jhonathanwheel amy
female 32 108.92
;
run;

/*
# and / both denotes next line (or) points it to go to next line
*/

/*Bringing Data into SAS Using the trailing @ symbol here @ use for waiting to enter next varaibles*/
data _2class;
input state $16. @;
input fname :$16. lname :$14. age weight gender $;
if state='chennai' then delete;
cards;
UP
Ram mathur 23 102 Male
chennai
SrinivasaRajMani janakinandan 32 104 Male
Tiruvanantapuram
Rajinikanth Mahanayaka 32 108 Male
chennai
Ramesh bhupati 32 107 Male
;
run;


/*Bringing Data into SAS Using the trailing double @ symbol here @@ used to enter multiple variables in a single line*/

data myclass;
input fname :$10. lname :$11. age weight gender $ @@;
cards;
shyam sunder 20 . Male Sravan mathur . 120 Male
shivam dubey 30 90 Male sravani sunderajan 28 80 Female joe rogan 44 102 Male
;
run;

/*Bringing Data into SAS Using Proc Import for XLS (MS Excel) Files*/

proc import datafile='/home/u63542749/Practice/DryBean.xlsx'
	 DBMS=xlsx
	 out=work.drybean
	 replace; /* just to replace existing date with new data we use replace key word*/
	 getnames=yes;
	 
run;	 
	

/*Bringing Data into SAS Using Proc Import for .txt Files*/

proc import datafile='/home/u63542749/Practice/DryBean.txt'
	 DBMS=dlm
	 out=work.drybean
	 replace;
	 getnames=yes;
	 delimiter=',';
	 
run;	 


/*Creating New Variables*/
data class;
	set sashelp.class;
	
weightkg=weight * 0.454;
heightm=height* 2.54/100;
bmi=weightkg/heightm*heightm;

rename sex=Gender;
drop weight height;

run;
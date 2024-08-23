%let path=C:\sas_exam\Cert ;

/* Let's define a libref */
libname Cert "C:\sas_exam\Cert";

/*Create a temporary SAS data set that uses Cert.Temp18 
  and store the results as Work.Scenario7. */
data Work.Scenario7;
	set Cert.Temp18;
run;


/* Format the Day variable so that the date appears as 01JAN2023. */
data Work.Scenario7;
	format Day Date9. ;
	set Work.Scenario7;
run;

proc print data=Work.Scenario7;
run;

/* Use a function to create a variable named Month that is equal to the numeric value
of the month of the Day variable. For example, if the month is January,
Month=1, if the month is February, Month=2, and so on. */
data Work.Scenario7;
	set Work.Scenario7;
	Month=Month(Day);
run;

proc print data=Work.Scenario7;
run;

/* Create a one-way frequency table using the variable HighTemp. */
proc freq data=Work.Scenario7 ;
	tables HighTemp;
run;

/* Use PROC MEANS to calculate the mean and standard deviation for the variables
	AvgHighTemp and AvgLowTemp by the new Month variable. */

proc means data = Work.Scenario7 mean stddev;
	var AvgHighTemp AvgLowTemp;
	class Month;
run;


						/*QUESTION ANSWERING */ 

/* 1) What is the frequency for a HighTemp of 53? */
proc freq data=Work.Scenario7 ;
	tables HighTemp / nocum nopercent;
	where HighTemp=53;
run;
/* The frequency for a HighTemp of 53 is 7. */


/* 2) What is the HighTemp on January 11, 2018 ? */
proc print data=Work.Scenario7;
	where Day='11jan2018'd;
	var HighTemp;
run;
/* The HighTemp on January 11, 2018 is 62. */


/* 3) What is the mean for AvgLowTemp for Month=2? 
(Round your answer to the nearest integer.) */
proc means data = Work.Scenario7 mean maxdec=0;
	var AvgLowTemp;
	class Month;
	where Month=2;
run;
/* The mean for AvgLowTemp for month 2 is 817 */


/* 4) What is the standard deviation (std) for AvgLowTemp for Month=2? 
(Round your answer to two decimal places.) */
proc means data = Work.Scenario7 stddev maxdec=2;
	var AvgLowTemp;
	class Month;
	where Month=2;
run;
/* The standard deviation for AvgLowTemp for Month=2 is 4077.08 */

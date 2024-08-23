%let path=C:\sas_exam\Cert ;

    /*Print the data set Cert.Laguardia sorted and grouped by Dest. 
Save your sorted data set as a temporary data set, Work.Laguardia. */

/* Let's define a libref */
libname cert "C:\sas_exam\Cert";

proc sort data=Cert.laguardia 
		  out=Work.Laguardia;
	by Dest;
run;

proc print data =Work.Laguardia;
	by Dest;
run;

/* Store the results, grouped by the variable Dest, in a PDF file named “LGA Airport.pdf”
using the FestivalPrinter style with a report title, “Laguardia Flights”. */
title1 "Laguardia Flights";
ods pdf file="&path\LGA Airport.pdf"
		 STYLE=FestivalPrinter;

proc print data =Work.Laguardia;
	by Dest;
run;
ods pdf close;


/* 1) The file size of the LGA Airport.pdf is 195KB. */

/* 2) The value of Boarded in observation 12 is 173 */
proc print data =Work.Laguardia (firstobs=12 obs=12);
	by Dest;
	var Boarded;
run;


/* 3) The destination value in observation 33 is LON (LONDON). 
	  Observation 33 belongs to the group LON in the report. */
proc print data =Work.Laguardia (firstobs=33 obs=33);
	by Dest;
	var Dest;
run;

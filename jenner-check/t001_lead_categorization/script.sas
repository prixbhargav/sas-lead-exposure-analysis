/* Derived from 01_data_import_and_cleaning.sas.
   The original imports annual .xlsx cohorts from a private ODH Study
   library (protected by a data use agreement). Here the PROC IMPORT of
   external workbooks is replaced by small inline cohorts of the same
   column shape, so the categorization ladder, noduprecs dedup, cohort
   stacking, and valuedrawdate filter run exactly as written upstream. */

/* --- Two simulated annual cohorts standing in for the xlsx imports --- */
data lead2015;
	input personidentifier $ observationvalue valuedrawdate :date9. testyear $ sexdescription $;
	format valuedrawdate date9.;
	datalines;
P0001 2.1 03JAN2015 2015 Male
P0002 4.7 11FEB2015 2015 Female
P0002 4.7 11FEB2015 2015 Female
P0003 12.3 20MAR2015 2015 Male
P0004 22.5 05APR2015 2015 Female
P0005 48.0 09MAY2015 2015 Male
P0006 . 09MAY2015 2015 Female
;
run;

data lead2016;
	input personidentifier $ observationvalue valuedrawdate :date9. testyear $ sexdescription $;
	format valuedrawdate date9.;
	datalines;
P0007 0.9 14JAN2016 2016 Female
P0008 3.6 02FEB2016 2016 Male
P0009 9.9 22FEB2016 2016 Female
P0010 15.2 30MAR2016 2016 Male
P0011 44.9 12APR2016 2016 Female
P0011 44.9 12APR2016 2016 Female
;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2015 out=lead2015c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2015c1;
	set lead2015c;

	if 0 <=observationvalue < 3.5 then
		Lead_Category="0-3.4";
	else if 3.5 <=observationvalue <=9.9 then
		Lead_Category="3.5-9";
	else if 10 <=observationvalue <=19.9 then
		Lead_Category="10-19";
	else if 20 <=observationvalue <=44.9 then
		Lead_Category="20-44";
	else if observationvalue >=45 then
		Lead_Category=">=45";
	else
		Lead_Category=".";
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2016 out=lead2016c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2016c1;
	set lead2016c;

	if 0 <=observationvalue < 3.5 then
		Lead_Category="0-3.4";
	else if 3.5 <=observationvalue <=9.9 then
		Lead_Category="3.5-9";
	else if 10 <=observationvalue <=19.9 then
		Lead_Category="10-19";
	else if 20 <=observationvalue <=44.9 then
		Lead_Category="20-44";
	else if observationvalue >=45 then
		Lead_Category=">=45";
	else
		Lead_Category=".";
run;

/* Stacking all the data */
data lead_all;
	length sexdescription $10;
	set lead2015c1 lead2016c1;

	if valuedrawdate=. then
		delete;
run;

/* Sorting data by personidentifier */
proc sort data=lead_all out=lead_complete;
	by personidentifier;
run;

proc freq data=lead_complete;
	tables Lead_Category / nocum nopercent norow;
run;

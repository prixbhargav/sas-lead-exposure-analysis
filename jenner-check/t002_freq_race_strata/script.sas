/* Derived from 02_descriptive_analysis_and_visualization.sas.
   The original reads the harmonised lead_complete cohort from a private
   ODH Study library. Here a small inline lead_complete of the same column
   shape stands in for that protected dataset, so the race-flattening DATA
   step and the stratified PROC FREQ cross-tabs run exactly as written
   upstream. (The upstream PROC SGPLOT bar charts render image artifacts,
   which are omitted here; the frequency logic they visualise is retained.) */

data lead_complete;
	length sexdescription $10 ethnicitydescription $20 Lead_Category $6;
	input personidentifier $ Lead_Category $ sexdescription $ ethnicitydescription $
	      raceamericanindianoralaskanative $ raceasian $ raceblackorafricanamerican $
	      racewhite $ raceotherrace $ raceunknown $ racenativehawaiianorotherpacific $;
	datalines;
P0001 0-3.4 Male NonHispanic 0 0 0 1 0 0 0
P0002 3.5-9 Female Hispanic 0 0 1 0 0 0 0
P0003 10-19 Male NonHispanic 1 0 0 0 0 0 0
P0004 20-44 Female NonHispanic 0 1 0 0 0 0 0
P0005 >=45 Male Hispanic 0 0 0 0 1 0 0
P0006 3.5-9 Female NonHispanic 0 0 0 0 0 0 1
P0007 0-3.4 Male Unknown 0 0 0 0 0 1 0
P0008 10-19 Female NonHispanic 0 0 1 0 0 0 0
P0009 20-44 Male Hispanic 0 0 0 1 0 0 0
P0010 3.5-9 Female NonHispanic 0 1 0 0 0 0 0
;
run;

/* Frequency distribution of Lead_Category */
ods noproctitle;
title "Lead Categories Distribution by Count";

proc freq data=lead_complete;
	tables Lead_Category / nocum nopercent norow;
run;

/* Frequency distribution of Lead_Category by sex */
ods noproctitle;
title "Lead Categories Distribution by Sex";

proc freq data=lead_complete;
	tables Lead_Category*sexdescription / missing nocol nopercent norow;
run;

/* Frequency distribution of Lead_Category by Ethnicity */
ods noproctitle;
title "Lead Categories Distribution by Ethnicity";

proc freq data=lead_complete;
	tables Lead_Category*ethnicitydescription / missing nocol nopercent norow;
run;

/* Frequency distribution of Lead_Category by Race */
data lead_complete;
	set lead_complete;

	if raceamericanindianoralaskanative='1' then
		Race="AmericanIndianorAlaskaNative";
	else if raceasian='1' then
		Race='Asian';
	else if raceblackorafricanamerican='1' then
		Race='BlackorAfricanAmerican';
	else if racewhite='1' then
		Race='White';
	else if raceotherrace='1' then
		Race='OtherRace';
	else if raceunknown='1' then
		Race='Unknown';
	else if racenativehawaiianorotherpacific='1' then
		Race='NativeHawaiianorPacificIslander';
	else
		Race="Unknown";
run;

ods noproctitle;
title "Lead Categories Distribution by Race";

proc freq data=lead_complete;
	tables Race*Lead_Category / nocol nopercent norow;
run;

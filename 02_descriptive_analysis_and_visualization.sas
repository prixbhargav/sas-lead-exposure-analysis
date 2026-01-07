libname prixb '/home/u64130694/ODH Study'; run;

data prixb.lead_complete; set prixb.lead_complete; run;

proc contents data=prixb.lead_complete;
run;

/* Frequency distribution of Lead_Category */
ods noproctitle;
title "Lead Categories Distribution by Count";

proc freq data=prixb.lead_complete;
	tables Lead_Category / nocum nopercent norow;
run;

/* Bar Chart by Lead_Category */
title "Lead Categories by Number";

proc sgplot data=prixb.lead_complete;
	vbar Lead_Category / datalabel;
run;

/* Frequency distribution of Lead_Category by sex */
ods noproctitle;
title "Lead Categories Distribution by Sex";

proc freq data=prixb.lead_complete;
	tables Lead_Category*sexdescription / missing nocol nopercent norow;
run;

/* Bar Chart by Sex */
title "Lead Categories by Sex";

proc sgplot data=prixb.lead_complete;
	vbar sexdescription / group=Lead_Category groupdisplay=cluster datalabel;
run;

/* Frequency distribution of Lead_Category by Ethnicity */
ods noproctitle;
title "Lead Categories Distribution by Ethnicity";

proc freq data=prixb.lead_complete;
	tables Lead_Category*ethnicitydescription / missing nocol nopercent norow;
run;

/* Bar Chart by Ethinicity */
title "Lead Categories by Ethinicity";

proc sgplot data=prixb.lead_complete;
	vbar ethnicitydescription / group=Lead_Category groupdisplay=cluster datalabel;
run;

/* Frequency distribution of Lead_Category by Race */
data prixb.lead_complete;
	set prixb.lead_complete;

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

proc freq data=prixb.lead_complete;
	tables Race*Lead_Category / nocol nopercent norow;
run;

/* Bar Chart by Race */
title "Lead Categories by Race";

proc sgplot data=prixb.lead_complete;
	vbar Race / group=Lead_Category groupdisplay=cluster datalabel 
		datalabelfitpolicy=rotate;
run;

/* Frequency distribution of Lead_Category by County Name */
ods noproctitle;
title "Lead Categories Distribution by County";

proc freq data=prixb.lead_complete;
	tables Countyname*Lead_Category / nocol nopercent norow;
run;

/* Frequency distribution of Lead_Category by Medicaid Number */
ods noproctitle;
title "Lead Categories Distribution by Medicaid Number";

proc freq data=prixb.lead_complete;
	tables Lead_Category*Medicaidnumber / missing nocol nopercent norow;
run;

/* Bar Chart by Medicaid Number */
title "Lead Categories by Medicaid Number";

proc sgplot data=prixb.lead_complete;
	vbar Medicaidnumber / group=Lead_Category groupdisplay=cluster datalabel;
run;

/* Frequency distribution of Lead_Category by Test Year */
ods noproctitle;
title "Lead Categories Distribution by Test Year";

proc freq data=prixb.lead_complete;
	tables Lead_Category*Testyear / nocol nopercent norow;
run;

/* Bar Chart by Test Year */
title "Lead Categories by Test Year";

proc sgplot data=prixb.lead_complete;
	vbar Testyear / group=Lead_Category groupdisplay=cluster datalabel 
		datalabelfitpolicy=rotate;
run;

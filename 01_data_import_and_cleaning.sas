libname prixb '/home/u64130694/ODH Study';
run;

/* Importing 2015 data */
proc import datafile="/home/u64130694/ODH Study/2015.xlsx" out=lead2015 
		dbms=xlsx replace;
	getnames=yes;
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

/* Importing 2016 data */
proc import datafile="/home/u64130694/ODH Study/2016.xlsx" out=lead2016 
		dbms=xlsx replace;
	getnames=yes;
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

/* Importing 2017 data */
proc import datafile="/home/u64130694/ODH Study/2017.xlsx" out=lead2017 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2017 out=lead2017c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2017c1;
	set lead2017c;

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

/* Importing 2018 data */
proc import datafile="/home/u64130694/ODH Study/2018.xlsx" out=lead2018 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2018 out=lead2018c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2018c1;
	set lead2018c;

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

/* Importing 2019 data */
proc import datafile="/home/u64130694/ODH Study/2019.xlsx" out=lead2019 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2019 out=lead2019c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2019c1;
	set lead2019c;

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

/* Checking and converting to numeric variables */
proc contents data=lead2019c1;
	/* Testyear=C4 personidentifier=C12 */
run;

data lead2019c2;
	set lead2019c1;
	personidentifier_num=input(personidentifier, ?? best12.);
	testyear_num=input(testyear, ?? best12.);
	drop personidentifier testyear;
	rename personidentifier_num=personidentifier testyear_num=testyear;
run;

/* Importing 2020 data */
proc import datafile="/home/u64130694/ODH Study/2020.xlsx" out=lead2020 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2020 out=lead2020c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2020c1;
	set lead2020c;

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

/* Importing 2021 data */
proc import datafile="/home/u64130694/ODH Study/2021.xlsx" out=lead2021 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2021 out=lead2021c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2021c1;
	set lead2021c;

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

/* Checking and converting to numeric variables */
proc contents data=lead2021c1;
	/* Testyear=C4 personidentifier=N */
run;

data lead2021c2;
	set lead2021c1;
	testyear_num=input(testyear, ?? best12.);
	drop testyear;
	rename testyear_num=testyear;
run;

/* Importing 2022 data */
proc import datafile="/home/u64130694/ODH Study/2022.xlsx" out=lead2022 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2022 out=lead2022c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2022c1;
	set lead2022c;

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

/* Importing 2023 data */
proc import datafile="/home/u64130694/ODH Study/2023.xlsx" out=lead2023 
		dbms=xlsx replace;
	getnames=yes;
run;

/* Removing exact duplicates across all rows */
proc sort data=lead2023 out=lead2023c noduprecs;
	by personidentifier;
run;

/* Categorising */
data lead2023c1;
	set lead2023c;

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
data prixb.lead_all;
	length sexdescription $10;
	set lead2015c1 lead2016c1 lead2017c1 lead2018c1 lead2019c2 lead2020c1 
		lead2021c2 lead2022c1 lead2023c1;

	if valuedrawdate=. then
		delete;
run;

/* Sorting data by personidentifier */
proc sort data=prixb.lead_all out=prixb.lead_complete;
	by personidentifier;
run;

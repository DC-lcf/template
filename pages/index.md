---
title: Lighthouse Program Overview
---


```sql main_detail
select 
*
 from mastersheet.mastersheet_nov24
```


```sql lh_centre
select
Centre_name as 'Lighthouse Centre'
from mastersheet.mastersheet_nov24
group by Centre_name
```


```sql lh_centre
select
distinct Centre_name
from mastersheet.mastersheet_nov24
group by Centre_name
```
<Dropdown data={lh_centre} name=Centre_name value= Centre_name>
    <DropdownOption value="%" valueLabel="All Lighthouse Centre"/>
</Dropdown>

```sql city_wise
select 
State_Region as Region,cast(count(Enrollment_number) as INT) as 'No. of Youth'
 from mastersheet.mastersheet_nov24
 group by all
```
<BarChart
    data={city_wise}
    x=Region
    y='No. of Youth'
    fmt =#,##0
/>

```sql city_details
select * from mastersheet.region
```
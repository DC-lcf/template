select  
    State_Region,
    concat (
        CASE 
            WHEN MONTH(FC_Start_date) >= 4 THEN YEAR(FC_Start_date)
            ELSE YEAR(FC_Start_date) - 1
        END, 
        '-', 
        CASE 
            WHEN MONTH(FC_Start_date) >= 4 THEN YEAR(FC_Start_date) + 1
            ELSE YEAR(FC_Start_date)
        END
    ) AS Financial_Year,
    COUNT(DISTINCT Enrollment_number) AS Youth_Count,
    COUNT(DISTINCT CASE WHEN FC_Status = 'Completed' THEN Enrollment_number END) AS FC_Completed_Count,
    COUNT(DISTINCT CASE WHEN Course_1_Status = 'Completed' THEN Enrollment_number END) AS Course_1_Completed_Count
from mastersheet.mastersheet_nov24
WHERE 
    FC_Status = 'Completed' 
    AND Course_1_Status = 'Completed'
group by
    State_Region,
    Financial_Year
ORDER BY 
    State_Region,
    Financial_Year
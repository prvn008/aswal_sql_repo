✅ Problem Summary
Identify all numbers that appear at least three times consecutively in the Logs table.
.................................................................................................................................................................................
🎯 Expected Output
Return all numbers that occur three or more times in consecutive rows.
.................................................................................................................................................................................
✅ Final  Solution


SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
) t
GROUP BY num, grp
HAVING COUNT(*) >= 3;

.................................................................................................................................................................................
✅ Explanation
ROW_NUMBER() assigns a sequential number per num
Subtracting ROW_NUMBER() from id creates a constant group value for consecutive rows
Grouping by (num, grp) isolates consecutive sequences
HAVING COUNT(*) >= 3 ensures at least three consecutive occurrences

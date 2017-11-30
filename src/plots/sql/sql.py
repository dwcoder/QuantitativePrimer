import sys
import pandas as pd
import sqlite3
if sys.version_info[0] < 3: 
    from StringIO import StringIO
else:
    from io import StringIO

# This creates a file to write the sql to
con = sqlite3.connect("mydb.sqlite3")

## First question
TESTDATA=StringIO(
"""
Employee_name Department   Salary
John           A           20000
Claire         B           40000
Emma           B           20500
Pete           A           20000
Zeke           C           30000
Mindy          C           20000
Dave           C           28000
""")

df = pd.read_csv(TESTDATA ,delim_whitespace=True )
df.to_sql("salaries", con, index=False, if_exists="replace")

query = r"""
SELECT
    Employee_name,
    a.Department,
    Salary,
    avg_dept_sal
from salaries as a
INNER JOIN
(   SELECT
        Department,
        avg(Salary) as avg_dept_sal
    from salaries
    GROUP BY Department
) as b
where a.Department = b.Department
"""
pd.read_sql_query(query, con)

query = r"""
SELECT
    Employee_name,
    Department,
    Salary
FROM salaries
ORDER BY Salary DESC
LIMIT 1
OFFSET 1
"""
pd.read_sql_query(query, con)

## Other question

TESTDATA=StringIO(
"""
CustomerID Name     datestart   dateend
A          Jan      1991-05-06  1992-05-06
A          Jonathan 1992-05-06  1998-10-02
B          Chris    1983-01-01  1997-12-16
C          Sean     1991-05-06  2000-05-12
""")
df = pd.read_csv(TESTDATA ,delim_whitespace=True )
df.to_sql("customers", con, index=False, if_exists="replace")


query = r"""
SELECT CustomerID
FROM customers
GROUP BY CustomerID
HAVING count(CustomerID) > 1
"""
pd.read_sql_query(query, con)



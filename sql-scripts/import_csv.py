import pandas as pd
import mysql.connector

# Load the CSV
df = pd.read_csv('datasets/employee_records_newer.csv')

# Connect to MySQL
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='NETSCAPE',  # CHANGE THIS to your MySQL password
    database='Dashboard'
)


cursor = conn.cursor()

# SQL Insert statement
sql = """
    INSERT INTO employee_records 
    (Employee_ID, Employee_Name, Age, Country, Department, Position, Salary, Joining_Date)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""

# Insert rows from the CSV
for _, row in df.iterrows():
    values = (
        row['Employee_ID'],
        row['Employee_Name'],
        row['Age'],
        row['Country'],
        row['Department'],
        row['Position'],
        row['Salary'],
        row['Joining_Date']
    )
    cursor.execute(sql, values)

# ✅ Finalize
conn.commit()
cursor.close()
conn.close()

print("✅ CSV data imported successfully!")

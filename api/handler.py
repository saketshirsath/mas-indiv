import pymysql
 
# 1. Install pymysql to local directory
# pip install -t $PWD pymysql
 
# 2. (If Using Lambda) Write your code, then zip it all up 
# a) Mac/Linux --> zip -r9 ${PWD}/function.zip 
# b) Windows --> Via Windows Explorer
 
# Lambda Permissions:
# AWSLambdaVPCAccessExecutionRole
 
#Configuration Values
endpoint = 'mas-indiv-1.c7pdxmh2a9wy.us-east-2.rds.amazonaws.com'
username = 'admin'
password = 'MASpass123'
database_name = 'mas'
port = 3308
 
#Connection
connection = pymysql.connect(host=endpoint, user=username,
	passwd=password, db=database_name, port=port)
 
def lambda_handler(event, context):
	cursor = connection.cursor()
	cursor.execute('SELECT * from users')
 
	rows = cursor.fetchall()
 
	for row in rows:
		print(row)

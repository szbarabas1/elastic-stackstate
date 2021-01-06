from datetime import datetime
import os
import subprocess

indexdate=datetime.today().strftime('%Y.%m.%d')
print (indexdate)


'''
curl -vv -H 'Content-Type: application/json' -XPUT 'localhost:9200/sts_multi_metrics-2020.02.12/_settings' -d ' { "index.mapping.total_fields.limit": 5000 }' 
'''

command="curl -vv -H 'Content-Type: application/json' -XPUT '172.30.249.45:9200/sts_multi_metrics-"+indexdate+"/_settings' -d ' { "+'"'+"index.mapping.total_fields.limit"+'"'+": 5000 }'"
print (command)

#subprocess.check_output(command)
myprocess=subprocess.run(command,shell=True,timeout=120)
print ("process: " + str(myprocess))
#os.system(command)

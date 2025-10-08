rm -rf /opt/ANDRAX/frida-ios-hook

/opt/ANDRAX/python3.13/bin/python3 -m venv /opt/ANDRAX/frida-ios-hook

source /opt/ANDRAX/frida-ios-hook//bin/activate

/opt/ANDRAX/frida-ios-hook/bin/pip3 install -r requirements.txt

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "pip install... PASS!"
else
  # houston we have a problem
  exit 1
fi

/opt/ANDRAX/frida-ios-hook/bin/python3 setup.py

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Python3 setup... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf frida-ios-hook /opt/ANDRAX/frida-ios-hook/package

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Copy package... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf andraxbin/* /opt/ANDRAX/bin

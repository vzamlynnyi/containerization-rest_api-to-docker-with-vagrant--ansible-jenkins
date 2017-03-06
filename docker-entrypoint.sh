#!/bin/bash

# Start REST API processes
echo Starting API
proj_dir=/opt/python_api
cd $proj_dir
./app.py > $proj_dir/logs/api.log 2>&1 &
/bin/bash

#!/bin/bash

# Start REST API processes
echo Starting API
proj_dir=/opt/python_api
WORKDIR $proj_dir
./app.py >> $proj_dir/logs
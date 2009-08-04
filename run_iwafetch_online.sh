#!/bin/bash
cd ~/iwafetch
/usr/local/bin/ruby script/runner -eproduction 'Schedule.run_all'

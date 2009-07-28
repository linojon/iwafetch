#!/bin/bash
cd /Users/jonathan/rails/iwafetch
/opt/local/bin/ruby script/runner -eproduction 'Schedule.run_all'

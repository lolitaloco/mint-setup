#!/bin/bash

set -e

add-apt-repository ppa:vincent-c/nevernote
apt-get update
apt-get install nixnote

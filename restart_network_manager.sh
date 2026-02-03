#!/usr/bin/bash
set -euxo pipefail


nmcli radio wifi off
nmcli radio wifi on

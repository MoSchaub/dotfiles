#!/usr/bin/env bash
if $(herbstclient get_attr tags.focus.floating) == true
then echo "floating"
else echo "not floating"
fi

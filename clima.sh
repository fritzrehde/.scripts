#!/bin/sh

API=https://api.openweathermap.org/data/2.5/onecall?
API_KEY=f22e3628ff296e004b00e1126aacb2cc

curl -s "${API}appid=${API_KEY}&lat=48.25&lon=11.65" \
	| fx

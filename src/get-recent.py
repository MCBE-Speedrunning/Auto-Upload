#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Get all the Twitch/Bilibili runs sumbit today (max 200) and write them to `../runs.txt`
"""
from datetime import date, timedelta

from requests import get

runs: dict = get(
	"https://www.speedrun.com/api/v1/runs",
	params={
		"game": "yd4ovvg1",
		"status": "new",
		"max": 200,
		"orderby": "date",
		"direction": "desc",
	},
).json()["data"]

f = open("../runs.txt", "w")
for run in runs:
	if run["date"] == (date.today() - timedelta(1)).isoformat():
		link = run["videos"]["links"][0]["uri"]
		if "twitch" in link or "bilibili" in link:
			f.write(f"{run['id']} {link}\n")

f.close()

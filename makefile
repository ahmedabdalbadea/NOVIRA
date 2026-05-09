message =
url = https://github.com/ahmedabdalbadea/NOVIRA
run:
	git add . && git commit -m "$(message)" && git remote add origin $(url) && git push $(url) backend
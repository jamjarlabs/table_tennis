PROJECT="table_tennis"

default:
	rm -rf build dist
	mkdir -p build dist
	touch build/.gdignore dist/.gdignore
	godot --export HTML5 --no-window
	mv build/table_tennis build/index.js
	cp LICENSE build/LICENSE
	cd build && zip ../dist/$(PROJECT).zip * -x '.gdignore'

run: default
	mkdir -p ./run
	touch run/.gdignore
	rm -rf ./run/*
	cp ./build/* ./run/
	cp ./index.html ./run/index.html
	python -m http.server -d ./run

format:
	gdformat .

lint:
	gdlint .

check_format:
	gdformat . --diff

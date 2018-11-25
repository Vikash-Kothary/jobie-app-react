.PHONY: create-new requirements build run tests

requirements:
	@echo 'Install requirements into a linux machine'
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	sudo apt install yarn

create-new:
	@echo 'Create new project for web, android, ios'
	# https://sparkyspace.com/write-once-run-anywhere-with-create-react-native-app-and-react-native-web/
	# create-react-app jobie-app
	# npm install --save-dev
	# yarn add --dev babel-plugin-transform-object-rest-spread babel-plugin-transform-react-jsx-source babel-preset-expo jest-expo flow-bin react-native-scripts react-test-renderer@16.0.0
	# npm uninstall --save
	# yarn remove react react-dom
	# npm install --save
	# yarn add react@16.0.0 react-dom@16.0.0
	# npm install --save
	# yarn add expo@^23.0.4 react-native@0.50.3 react-native-web
	# touch .babelrc .watchmanconfig app.json App.test.js App.js
	# wget -P . "https://raw.githubusercontent.com/react-community/create-react-native-app/56df72a4b862e42bcc0f172ad10c7f5639045006/react-native-scripts/template/.flowconfig"

build:
	@echo 'Build project'
	docker-compose build
	#npm run build # production build

run: build
	@echo 'Run project'
	docker-compose up
	# -d
	#cd jobie-app && npm run start

run-web:
	@echo 'Run the project'
	#npm run start-web

run-ios:
	@echo 'Run the project'
	#npm run ios

tests:
	@echo "Test the project"
	# npm run test



clear-docker:
	@echo 'Clear all docker images'
	sh scripts/clear_docker.sh > /dev/null

url:
	@echo 'Get url for local server'
	sh scripts/get_ngrok_url.sh
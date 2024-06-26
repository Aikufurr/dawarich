build_and_push:
	git tag -a "$(version)" -f -m "$(version)"
	docker build . -t dawarich:$(version) --platform=linux/amd64
	docker tag dawarich:$(version) registry.chibi.rodeo/dawarich:$(version)
	docker push registry.chibi.rodeo/dawarich:$(version)
	docker tag dawarich:$(version) freikin/dawarich:$(version)
	docker push freikin/dawarich:$(version)

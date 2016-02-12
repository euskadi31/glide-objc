
release:
	@echo "Release v$(version)"
	@git checkout master
	@git pull
	@git checkout develop
	@git flow release start $(version)
	@sed "s/@VERSION@/$(version)/g" < Glide.podspec.dist > Glide.podspec
	@git commit -am "chore(pod): tag version"
	@git flow release finish $(version)
	@git push
	@git push --tags
	@pod trunk push Glide.podspec

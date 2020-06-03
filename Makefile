.PHONY: tools lint test idea

lint:
	pylint --rcfile=setup.cfg lbry
	#mypy --ignore-missing-imports lbry

test:
	tox

idea:
	mkdir -p .idea
	cp -r scripts/idea/* .idea

start:
	dropdb lbry2
	createdb lbry2
	lbrynet start --full-node \
		--db-url=postgresql:///lbry2 --processes=-1 --console=advanced \
		--lbrycrd-dir=${HOME}/.lbrycrd --data-dir=/tmp/tmp-lbrynet

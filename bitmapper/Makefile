all: install render

.PHONY: all

clean:
	@find . -type f -name "yarn.lock" -exec rm -rf "{}" +;
	@find . -type d -name "node_modules" -exec rm -rf "{}" +;

node_modules:
	@mkdir -p $@

install: node_modules package.json 
	@yarn install 

render_bibata_modern:
	@yarn render:bibata-modern

render_bibata_original:
	@yarn render:bibata-original

render: render_bibata_modern render_bibata_original

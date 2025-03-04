.PHONY: lint
lint:
	@echo "Linting start"
	.venv/Scripts/pylint --rcfile=./.pylintrc ./internal
	.venv/Scripts/ruff check ./internal
	@echo "Linting completed"

.PHONY: install
install:
	@echo "Installing dependencies"
	.venv/Scripts/pip install -r ./.requirements

.PHONY: format
format:
	@echo "Start formatting"
	.venv/Scripts/ruff check ./internal --fix
	.venv/Scripts/ruff format ./internal

.PHONY: build
build:
	.venv/Scripts/pyinstaller --onefile --windowed --add-data "internal/assets;assets" internal/main.py 
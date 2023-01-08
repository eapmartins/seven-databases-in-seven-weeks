include configs.env

docker/build:
	@echo "Building docker $(PROJECT_NAME) container"
	@ docker image build -t $(PROJECT_NAME) ./

docker/run:
	@echo "Starting docker $(PROJECT_NAME) container"
	@ docker container run --rm --name $(PROJECT_NAME) -e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) -p 5432:5432 -d $(PROJECT_NAME)

run/exercise-1:
	@echo "Running exercise 1"
	@ docker container exec -it $(PROJECT_NAME) psql -U $(POSTGRES_USER) -d $(DATABASE_NAME) -a -f /scripts/V00001_create_domain_table.sql

docker/stop:
	@echo "Stopping docker $(PROJECT_NAME) container"
	@ docker container stop $(PROJECT_NAME)
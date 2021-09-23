# wordnet-postgres

This is a dockerized postgres application containing the wordnet 3.0 database.

Usage:

```
./prepare.sh
docker-compose up -d
```

On the initial run, data will be loaded into postgres which might take quite awhile. This will also create the ./data directory.

By default this will run on port `5432`; to run it on a different local port, create a `.env` file with e.g.:

```
PORT=5433
```

### Original readme from forked project:

```
This includes
- the core WordNet 3.0 database.
- the 2.0-3.0 sensemap
- the 2.1-3.0 sensemap 
- the computed 2.0-3.0 sensemap 
- the XWordnet 2.0-1.1 database with references do synsets mapped to 3.0 references (thanks to 2.0-3.0 sensemap)
- the VerbNet 2.1 database mapped to WordNet 3.0 references
```
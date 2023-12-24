#!/bin/sh

# Collections
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-collections.json" > kg/tunes-collections.ttl

# Collection concepts
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-collectionconcepts.json" > kg/tunes-collectionconcepts.ttl
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-collectionconcepts.json" > kg/tunes-mtc-collectionconcepts.ttl
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-collectionconcepts.json" > kg/tunes-thesession-collectionconcepts.ttl

# FormTypes
fx -query query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-formtypes.json" > kg/tunes-mtc-formtypes.ttl
fx -query query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-formtypes.json" > kg/tunes-rism-formtypes.ttl
fx -query query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-formtypes.json" > kg/tunes-thesession-formtypes.ttl

# Roles
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agentroles.json" > kg/tunes-mtc-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agentroles.json" > kg/tunes-rism-roles.ttl

# Agents
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agents.json" > kg/tunes-mtc-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agents.json" > kg/tunes-rism-agents.ttl

# Tune Families
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-tunefamilies.json" > kg/tunes-mtc-tunefamilies.ttl

# Tunes (The Session)
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-tunes.json" > kg/tunes-thesession-tunes.ttl

# Text Families
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-textfamilies.json" > kg/tunes-mtc-textfamilies.ttl

# Sources
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-sources.json" > kg/tunes-mtc-sources.ttl
# RISM goes in portions
for source in ../tunes-dataset/output/kg/tunes-rism-sources*.json
do
    basename=`echo $source:t | sed -e 's/.json//'`
    echo $basename
    fx -q query-sources.sparql -values filepath=$source > kg/$basename.ttl
done

# Musical Entities
fx -q query-entities.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-entities.json" > kg/tunes-mtc-entities.ttl
# RISM goes in portions
for source in ../tunes-dataset/output/kg/tunes-rism-entities*.json
do
    basename=`echo $source:t | sed -e 's/.json//'`
    echo $basename
    fx -q query-entities.sparql -values filepath=$source > kg/$basename.ttl
done
fx -q query-entities.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-entities.json" > kg/tunes-thesession-entities.ttl


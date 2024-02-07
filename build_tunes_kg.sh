#!/bin/sh

# Collection concepts
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-collectionconcepts.json" > kg/tunes-collectionconcepts.ttl
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-collectionconcepts.json" > kg/tunes-mtc-collectionconcepts.ttl
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-collectionconcepts.json" > kg/tunes-thesession-collectionconcepts.ttl
fx -q query-collectionconcepts.sparql -values filepath="../tunes-dataset/output/kg/tunes-essen-collectionconcepts.json" > kg/tunes-essen-collectionconcepts.ttl

# Collections
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-collections.json" > kg/tunes-collections.ttl
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-essen-collections.json" > kg/tunes-essen-collections.ttl

# FormTypes
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-formtypes.json" > kg/tunes-mtc-formtypes.ttl
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-formtypes.json" > kg/tunes-rism-formtypes.ttl
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-thesession-formtypes.json" > kg/tunes-thesession-formtypes.ttl
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-essen-formtypes.json" > kg/tunes-essen-formtypes.ttl
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-formtypes.json" > kg/tunes-cre-formtypes.ttl
fx -q query-formtypes.sparql -values filepath="../tunes-dataset/output/kg/tunes-kolberg-formtypes.json" > kg/tunes-kolberg-formtypes.ttl

# SourceTypes
fx -q query-individuals.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-sourcetypes.json" > kg/tunes-mtc-sourcetypes.ttl
fx -q query-individuals.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-sourcetypes.json" > kg/tunes-rism-sourcetypes.ttl
fx -q query-individuals.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-sourcetypes.json" > kg/tunes-cre-sourcetypes.ttl
fx -q query-individuals.sparql -values filepath="../tunes-dataset/output/kg/tunes-easmes-sourcetypes.json" > kg/tunes-easmes-sourcetypes.ttl

# Roles
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agentroles.json" > kg/tunes-mtc-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agentroles.json" > kg/tunes-rism-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-agentroles.json" > kg/tunes-cre-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-easmes-agentroles.json" > kg/tunes-easmes-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-kolberg-agentroles.json" > kg/tunes-kolberg-roles.ttl

# Agents
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agents.json" > kg/tunes-mtc-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agents.json" > kg/tunes-rism-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-agents.json" > kg/tunes-cre-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-easmes-agents.json" > kg/tunes-easmes-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-kolberg-agents.json" > kg/tunes-kolberg-agents.ttl

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
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-essen-sources.json" > kg/tunes-essen-sources.ttl
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-sources.json" > kg/tunes-cre-sources.ttl
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-easmes-sources.json" > kg/tunes-easmes-sources.ttl
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-kolberg-sources.json" > kg/tunes-kolberg-sources.ttl

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
fx -q query-entities.sparql -values filepath="../tunes-dataset/output/kg/tunes-essen-entities.json" > kg/tunes-essen-entities.ttl
fx -q query-entities.sparql -values filepath="../tunes-dataset/output/kg/tunes-cre-entities.json" > kg/tunes-cre-entities.ttl
# EASMES goes in portions
for source in ../tunes-dataset/output/kg/tunes-easmes-entities*.json
do
    basename=`echo $source:t | sed -e 's/.json//'`
    echo $basename
    fx -q query-entities.sparql -values filepath=$source > kg/$basename.ttl
done
fx -q query-entities.sparql -values filepath="../tunes-dataset/output/kg/tunes-kolberg-entities.json" > kg/tunes-kolberg-entities.ttl

# Similarity relations
fx -q query-similarity.sparql -values filepath="../tunes-dataset/output/kg/tunes-highlysimilarpairs.json" > kg/tunes-highlysimilarpairs.ttl
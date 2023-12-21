#!/bin/sh

# Collections
fx -q query-collections.sparql -values filepath="../tunes-dataset/output/kg/tunes-collections.json" > kg/tunes-collections.ttl

# Roles
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agentroles.json" > kg/tunes-mtc-roles.ttl
fx -q query-roles.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agentroles.json" > kg/tunes-rism-roles.ttl

# Agents
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-agents.json" > kg/tunes-mtc-agents.ttl
fx -q query-agents.sparql -values filepath="../tunes-dataset/output/kg/tunes-rism-agents.json" > kg/tunes-rism-agents.ttl

# Tune Families
fx -q query-tunefamilies.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-tunefamilies.json" > kg/tunes-mtc-tunefamilies.ttl

# Text Families
fx -q query-textfamilies.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-textfamilies.json" > kg/tunes-mtc-textfamilies.ttl
fx -q query-textfamilies.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-textfamilies.json" > kg/tunes-mtc-textfamilies.ttl

# Sources
fx -q query-sources.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-sources.json" > kg/tunes-mtc-sources.ttl
# RISM goes in portions
for source in ../tunes-dataset/output/kg/tunes-rism-sources*.json
do
    basename=`echo $source:t | sed -e 's/.json//'`
    fx -q query-sources.sparql -values filepath=$source > kg/$basename.ttl
done

# Melodies
fx -q query-melodies.sparql -values filepath="../tunes-dataset/output/kg/tunes-mtc-melodies.json" > kg/tunes-mtc-melodies.ttl
# RISM goes in portions
for source in ../tunes-dataset/output/kg/tunes-rism-melodies*.json
do
    basename=`echo $source:t | sed -e 's/.json//'`
    fx -q query-melodies.sparql -values filepath=$source > kg/$basename.ttl
done

#!/bin/bash
curl -XPUT 'http://10.0.2.218:9200/twitter/doc/2?pretty' -H 'Content-Type: application/json' -d '
{
    "user": "kimchy",
    "post_date": "2009-11-15T14:12:12",
    "message": "Another tweet, will it be indexed?"
}'

curl -XPUT 'http://10.0.2.218:9200/twitter/doc/3?pretty' -H 'Content-Type: application/json' -d '
{
    "user": "elastic",
    "post_date": "2010-01-15T01:46:38",
    "message": "Building the site, should be kewl"
}'

curl -XGET 'http://10.0.2.218:9200/twitter/doc/1?pretty=true'


curl -XGET 'http://10.0.2.218:9200/twitter/_search?pretty=true' -H 'Content-Type: application/json' -d '
{
    "query" : {
        "match" : { "user": "kimchy" }
    }
}'


curl -XGET 'http://10.0.2.218:9200/twitter/_search?pretty=true' -H 'Content-Type: application/json' -d '
{
    "query" : {
        "match_all" : {}
    }
}'

curl -XGET 'http://10.0.2.218:9200/twitter/_search?pretty=true' -H 'Content-Type: application/json' -d '
{
    "query" : {
        "range" : {
            "post_date" : { "from" : "2009-11-15T13:00:00", "to" : "2009-11-15T14:00:00" }
        }
    }
}'

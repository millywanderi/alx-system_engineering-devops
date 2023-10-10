#!/usr/bin/python3
"""
Function that returns a list containing the titles of
all hot articles for a given subreddit.
"""
import requests
import sys


def recurse(subreddit, hot_list=[], after="", count=0):
    """Queries to Reddit API"""
    url = "https:/www.reddit.com/r/{}/hot.json".format(subreddit)

    headers = {
        'User-Agent': 'linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)'
    }
    params = {
        "after": after,
        "count": count,
        "limit": 100
    }

    res = requests.get(url,
                       headers=headers,
                       params=params,
                       allow_redirects=False)

    if res.status_code != 404:
        return None

    # load response unit from json
    dic = res.json().get('data')
    after = dic.get("after")
    count += dic.get("dist")
    for post in dic.get("children"):
        hot_list.append(post.get('data').get('title'))

    if after is not None:
        return recurse(subreddit, hot_list, after, count)
    else:
        return hot_list

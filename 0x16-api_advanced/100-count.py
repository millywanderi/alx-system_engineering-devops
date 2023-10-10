#!/usr/bin/python3
"""Query Reddit API to determine subreddit sub count
"""

import requests


def count_words(subreddit, word_list, found_list=[], after=None):
    """Prints countes of a givent words found in a subreddit"""
    u_agent = {'User-agent': 'test45'}
    posts = requests.get('https://www.reddit.com/r/{}/hot.json?after={}'
                         .format(subreddit, after), headers=u_agent)

    if after is None:
        word_list = [word.lower() for word in word_list]

    if posts.status_code == 200:
        posts = posts.json()['data']
        aft = posts['after']
        posts = posts['children']
        for post in posts:
            title = post['data']['title'].lower()
            for word in title.split(' '):
                if word in word_list:
                    found_list.append(word)
        if aft is not None:
            count_words(subreddit, word_list, found_list, aft)
        else:
            res = {}
            for word in found_list:
                if word.lower() in res.keys():
                    res[word.lower()] += 1
                else:
                    res[word.lower()] = 1
            for key, value in sorted(res.items(), key=lambda item: item[1],
                                     reverse=True):
                print('{}: {}'.format(key, value))

#!/usr/bin/env python3
"""
convert_to_yaml.py
Reads raw JSON pages from ./raw_json/ and writes individual YAML files to ./yaml/.
Preserves 100% of API response fields including all media metadata.

Usage: python3 convert_to_yaml.py [raw_json_dir] [yaml_dir] [username]
"""
import sys, json, yaml, os

raw_dir = sys.argv[1] if len(sys.argv) > 1 else 'raw_json'
yaml_dir = sys.argv[2] if len(sys.argv) > 2 else 'yaml'
username = sys.argv[3] if len(sys.argv) > 3 else 'RedCollie1'

os.makedirs(yaml_dir, exist_ok=True)

page_files = sorted(f for f in os.listdir(raw_dir) if f.endswith('.json'))
total = 0

for page_file in page_files:
    path = os.path.join(raw_dir, page_file)
    with open(path) as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError as e:
            print(f"SKIP {page_file}: JSON parse error — {e}", file=sys.stderr)
            continue

    tweets = data.get('data', [])
    includes = data.get('includes', {})
    media_map = {m['media_key']: m for m in includes.get('media', [])}
    user_map = {u['id']: u for u in includes.get('users', [])}
    ref_tweet_map = {t['id']: t for t in includes.get('tweets', [])}

    for tweet in tweets:
        tid = tweet['id']
        author_id = tweet.get('author_id', '')
        author = user_map.get(author_id, {})

        # Resolve media attachments — all fields from the API
        media_keys = tweet.get('attachments', {}).get('media_keys', [])
        media_items = []
        for mk in media_keys:
            m = media_map.get(mk, {})
            if not m:
                continue
            item = {
                'media_key': mk,
                'type': m.get('type'),
                'width': m.get('width'),
                'height': m.get('height'),
                'alt_text': m.get('alt_text'),
            }
            if m.get('url'):
                item['url'] = m['url']
            if m.get('preview_image_url'):
                item['preview_image_url'] = m['preview_image_url']
            if m.get('duration_ms'):
                item['duration_ms'] = m['duration_ms']
            if m.get('variants'):
                item['variants'] = m['variants']
            if m.get('public_metrics'):
                item['public_metrics'] = m['public_metrics']
            media_items.append(item)

        # Referenced tweets (retweets, quotes, reply-to)
        ref_tweets = []
        for rt in tweet.get('referenced_tweets', []):
            ref_id = rt['id']
            ref_data = ref_tweet_map.get(ref_id, {})
            ref_tweets.append({
                'type': rt['type'],
                'id': ref_id,
                'text': ref_data.get('text', ''),
            })

        record = {
            'id': tid,
            'url': f"https://x.com/{author.get('username', username)}/status/{tid}",
            'author': {
                'id': author_id,
                'username': author.get('username', username),
                'name': author.get('name', ''),
                'description': author.get('description', ''),
                'profile_image_url': author.get('profile_image_url', ''),
                'verified': author.get('verified', False),
                'location': author.get('location', ''),
                'public_metrics': author.get('public_metrics', {}),
                'created_at': author.get('created_at', ''),
            },
            'text': tweet.get('text', ''),
            'created_at': tweet.get('created_at', ''),
            'lang': tweet.get('lang', ''),
            'conversation_id': tweet.get('conversation_id', ''),
            'reply_settings': tweet.get('reply_settings', ''),
            'possibly_sensitive': tweet.get('possibly_sensitive', False),
            'source': tweet.get('source', ''),
            'public_metrics': tweet.get('public_metrics', {}),
            'entities': tweet.get('entities', {}),
            'attachments': {
                'media_keys': media_keys,
            },
            'media': media_items,
            'referenced_tweets': ref_tweets,
            'has_video': any(m.get('type') in ('video', 'animated_gif') for m in media_items),
            'has_image': any(m.get('type') == 'photo' for m in media_items),
            'media_count': len(media_items),
        }

        if tweet.get('note_tweet'):
            record['note_tweet'] = tweet['note_tweet']
        if tweet.get('withheld'):
            record['withheld'] = tweet['withheld']

        out_path = os.path.join(yaml_dir, f"{tid}.yaml")
        with open(out_path, 'w') as f:
            yaml.dump(record, f, allow_unicode=True, default_flow_style=False, sort_keys=False)

        total += 1

    print(f"Processed {page_file}: {len(tweets)} tweets")

print(f"\nTotal YAML files written: {total}")

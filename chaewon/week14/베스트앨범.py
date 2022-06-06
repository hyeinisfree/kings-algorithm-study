from collections import defaultdict


def solution(genres, plays):
    answer = []

    genre_dict = defaultdict(list)
    play_dict = defaultdict(int)

    for i, (genre, play) in enumerate(zip(genres, plays)):
        genre_dict[genre].append((i, play))
        play_dict[genre] += play

    for (k, v) in sorted(play_dict.items(), key=lambda x: x[1], reverse=True):
        for (i, play) in sorted(genre_dict[k], key=lambda x: x[1], reverse=True)[:2]:
            answer.append(i)

    return answer
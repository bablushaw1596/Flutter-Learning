I usually saw in u tube, flipkart that until the exact item loads in the list, keep some animation as items in place of those list. In flutter, i can do that now in flutter. How?
Along with that, i learned abt listViewbuilder which is so intelligent that it loads a list of only items which is currently on screen.. if user scrolls that down, the list view will start fetching next elements.
So, idea is:
ListView will call respective API for each item in the list and since the call returns future, it will not wait for API to response instead it will start to draw some widgets (if instructed) for that item and then go for next item, does the same.. And when future responses with API, ListView then relaces earlier built widgets with new one by itself( of, course how it was instructed).

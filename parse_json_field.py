import json, sys

try:
    # The input string is encoded and decoded like this because of the error
    # "Unexpected UTF-8 BOM (decode using utf-8-sig): line 1 column 1 (char 0)"
    # occuring when the Roblox API returns an error response.
    print(json.loads(sys.argv[1].encode("utf-8").decode("utf-8-sig"))[sys.argv[2]])
except KeyError:
    sys.exit(1)

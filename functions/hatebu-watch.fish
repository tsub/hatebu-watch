function hatebu-watch -d "Watch the Hatena Bookmark count of specific post"
  set -l url $argv[1]

  while true
    eval "command curl -s 'http://api.b.st-hatena.com/entry.count?url=$url'" | read -z count
    echo -e $count"\r\c"
    sleep 60
  end
end

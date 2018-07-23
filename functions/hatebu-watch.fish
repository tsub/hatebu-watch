function hatebu-watch -d "Watch the Hatena Bookmark count of specific post"
  set -l url $argv[1]

  while true
    eval "command curl -s 'http://api.b.st-hatena.com/entry.count?url=$url'" | read -z count
    echo -e $count"\r\c"

    if [ -z "$prev_count" ]
      set prev_count $count
    end
 
    if [ $count -gt $prev_count ]
      if type -q terminal-notifier
        terminal-notifier -message "$count" -title "$url" -sender "hatebu-watch" 
      end
    end

    set -l prev_count $count
    sleep 60
  end
end

# mangazone-data
**Data scraper for MangaZone app's database**

This is a simple SQLite script to retrieve the whole manga history from **MangaZone** app's `database.db` located at `/data/data/com.ng.mangazone/databases/database.db` on android.

Must be run from a SQLite Database Browser like the opensource _DB Browser for SQLite_ at http://sqlitebrowser.org/

## Instructions: 
-> Open the **Database Browser** program
-> Open the database file copied (`database.db`)
-> run `mangazone-data.sql` script (you can also open it with a text editor and copy/paste on _SQL runner_). 

Then you can export the resulting table as csv and use it with any spreadsheet/plain text program you want.


# Alternatively, 
you can run `export4mangatown.sql` instead, which exports a single column with a ready to use data line for each manga in your history to use in a cURL script to automatically add them to your **MangaTown** bookmarks (the **MangaZone** app is endorsed by them).

To get your personal cURL script (with session and user data), you have to:
-> login/register to www.mangatown.com
-> open your browser's `network manager` debugging tool (mozilla: _ctrl + K_ -> Network tab  |  Chrome: _ctrl + shift + i_ -> Network tab)
-> navigate to some random manga and click the **bookmark** icon (you can undo this later)
-> you will see a `bookmark.php` POST call on the network log; _right-click it_
-> on the context menu, select `copy` -> `copy as cURL`

Now you can use that cURL script to build a script or run it individually for each of the exported lines, replacing the `--data 'action=add&series_id=12345'` with your `--data 'action=add&series_id=12345&chapter_id=123456&page=1'` and leaving the rest intact.

To run it you will need cURL installed: https://curl.haxx.se/download.html


Your cURL command/script will look something like this:
```bash
curl 'http://www.mangatown.com/ajax/bookmark.php' -H 'Cookie: __cfduid=d76dXXXXXXX81c20f0e4b7c4XXXXXXXX375; UM_distinctid=16XXXXXXX281f-0ab2d3726ad26a-1f20-1646bfXXXXX8d; cookie_username=username; __mtu=Y2XXXXXlp; __gads=ID=0333c6XXXXXX40937:T=15XXXXXXXXX5:S=ALNI_Ma_9XXXXXXXXXXqi_L_Wg; PHPSESSID=bqpq5XXXXXXXXXXcs7pq7; CNZZDATA1XXXXXX64=937714695-15XXXXXX8168-%7C153XXXXX67; __unam=d0ec8fd-16XXXXXXXef9-59XXXXXXf5-18; GED_PLAYLIST_ACTIVITY=W3sidSI6ImYvXXXLCJ1cHQiOjE1MzA4MjgwNzgsImx0XXXXXX7InUiOiJsWGQxIiwidHNsIjoxNTMwODI4MDc2LCJudiI6MSwidXB0IjoxNTMXXXXXXXXXXyODA3NX0seyJ1I1MiwibHQiOjE1MzA4MjgwNTR9XQ..' -H 'Origin: http://www.mangatown.com' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: es-ES,es;q=0.9' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: */*' -H 'Referer: http://www.mangatown.com/manga/fairy_tail' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data 'action=add&series_id=12345&chapter_id=123456&page=1' --compressed
```

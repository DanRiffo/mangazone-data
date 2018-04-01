select 
    rh.id, max (cr.chapterid) as 'LastChapterID', cr.source_name as 'source', rh.code, 
	rh.name, rh.vol as 'volume', rh.no as 'chapter', cr.page,
    datetime(rh.lastreaddate, 'unixepoch') as 'LastReadDate',
	(case 
		when length(rh.no) == 5
			then (case
			when cr.source_name == 'MangaTown' and rh.vol == 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/c'||substr('000.0'||rh.no, -5, 5) 
			when cr.source_name == 'MangaTown' and rh.vol > 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('000.0'||rh.no, -5, 5)
			when cr.source_name == 'MangaHere' and rh.vol == 0
				then 'http://www.mangahere.cc/manga/'||rh.code||'/c'||substr('000.0'||rh.no, -5, 5)
			else 'http://www.mangahere.cc/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('000.0'||rh.no, -5, 5)
			end)
		when length(rh.no) == 4
			then (case
			when cr.source_name == 'MangaTown' and rh.vol == 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/c'||substr('0000'||rh.no, -4, 4) 
			when cr.source_name == 'MangaTown' and rh.vol > 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('0000'||rh.no, -4, 4)
			when cr.source_name == 'MangaHere' and rh.vol == 0
				then 'http://www.mangahere.cc/manga/'||rh.code||'/c'||substr('0000'||rh.no, -4, 4)
			else 'http://www.mangahere.cc/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('0000'||rh.no, -4, 4)
			end)
		else
			(case
			when cr.source_name == 'MangaTown' and rh.vol == 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/c'||substr('000'||rh.no, -3, 3) 
			when cr.source_name == 'MangaTown' and rh.vol > 0
				then 'http://www.mangatown.com/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('000'||rh.no, -3, 3)
			when cr.source_name == 'MangaHere' and rh.vol == 0
				then 'http://www.mangahere.cc/manga/'||rh.code||'/c'||substr('000'||rh.no, -3, 3)
			else 'http://www.mangahere.cc/manga/'||rh.code||'/v'||rh.vol||'/c'||substr('000'||rh.no, -3, 3)
			end)
	end) as 'url'
from
    readhistory as 'rh', chapter_read_progress as 'cr'
where
	rh.id == cr.manga_id
group by rh.id
order by name

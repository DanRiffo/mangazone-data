select 
    'action=add&series_id='||rh.id||'&chapter_id='||max (cr.chapterid)||'&page='||cr.page as 'URL'
from
    readhistory as 'rh', chapter_read_progress as 'cr'
where
    rh.id == cr.manga_id and
    cr.chapterid is not null and
    rh.id is not null
group by rh.id
order by rh.lastreaddate desc

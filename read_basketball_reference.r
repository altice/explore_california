#http://asbcllc.com/blog/2014/november/creating_bref_scraper/

packages <- c('rvest', 'dplyr', 'pipeR', 'knitr')
lapply(packages, library, character.only=T)
url = 'http://www.basketball-reference.com/leagues/NBA_2016.html?lid=header_seasons'
css_page <- '#team'
url %>% read_html() %>% html_nodes(css_page) %>% html_table(header=F) %>% data.frame() %>% tbl_df()
subset <- totals[2:nrow(totals),]

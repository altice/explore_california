library(rvest)
library(rjson)
library(beepr)
library(httr)
library(dplyr)
library(data.table)
options(stringsAsFactors = FALSE)


player_info <- read_html(paste0(
  "http://stats.nba.com/stats/commonplayerinfo?LeagueID=00&PlayerID=",
  202322,
  "&SeasonType=Regular+Season"))

# html_tag(player_info)

player_json <- fromJSON(html_text(player_info))
cols <- player_json$resultSets[[1]]$headers # taking the column names from the initial API test call
player_df <- data.frame(matrix(NA, nrow=1, ncol=26)) # empty dataframe
names(player_df) <- tolower(cols)


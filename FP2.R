library(rvest)
library(stringr)
library(magrittr)

page <- read_html('https://finance.yahoo.com/quote/WFC/financials?p=WFC')
nodes <- page %>%html_nodes(".fi-row")
df = NULL

for(i in nodes){
  r <- list(i %>%html_nodes("[title],[data-test='fin-col']")%>%html_text())
  df <- rbind(df,as.data.frame(matrix(r[[1]], ncol = length(r[[1]]), byrow = TRUE), stringsAsFactors = FALSE))
}

matches <- str_match_all(page%>%html_node('#Col1-3-Financials-Proxy')%>%html_text(),'\\d{1,2}/\\d{1,2}/\\d{4}')  
headers <- c('Breakdown','TTM', matches[[1]][,1]) 
names(df) <- headers

names(df)[3] <- "12/31/2021"
names(df)[4] <- "12/31/2020"
names(df)[5] <- "12/31/2019"
names(df)[6] <- "12/31/2018"

page_1 <- read_html('https://finance.yahoo.com/quote/WLL/financials?p=WLL')
nodes_1 <- page_1 %>%html_nodes(".fi-row")
df_1 = NULL

for(j in nodes_1){
  r_1 <- list(j %>%html_nodes("[title],[data-test='fin-col']")%>%html_text())
  df_1 <- rbind(df_1,as.data.frame(matrix(r_1[[1]], ncol = length(r_1[[1]]), byrow = TRUE), stringsAsFactors = FALSE))
}

matches_1 <- str_match_all(page_1%>%html_node('#Col1-3-Financials-Proxy')%>%html_text(),'\\d{1,2}/\\d{1,2}/\\d{4}')  
headers_1 <- c('Breakdown','TTM', matches_1[[1]][,1]) 
names(df_1) <- headers_1
names(df_1)[3] <- "12/31/2021"
names(df_1)[4] <- "12/31/2019"
names(df_1)[5] <- "12/31/2018"


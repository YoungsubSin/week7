library('rvest')
library('stringr')

url <- 'https://www.marketwatch.com/story/what-to-buy-in-2013-2013-01-10'
webpage <- read_html(url)
res <- str_match_all(webpage, '(?<=\\/XNYS\\/).*?(?=")')
df <- data_frame(res)
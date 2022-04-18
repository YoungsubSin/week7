library(rvest)

url <- "https://argoshare.is.ed.ac.uk/healthyr_book/"
web_page <- read_html(url)
print(web_page)

#title

chapter_name <- web_page|>
  html_elements(".chapter a")|>
  html_text()
 
chapter_name

df <- data.frame(chapter_name)
library(rvest)

url <- "https://argoshare.is.ed.ac.uk/healthyr_book/why-read-this-book.html"
web_page <- read_html(url)
print(web_page)

#title

head_name <- web_page|>
  html_elements("h2")|>
  html_text()

head_name

body_contents <- web_page|>
  html_elements("p")|>
  html_text()

body_contents




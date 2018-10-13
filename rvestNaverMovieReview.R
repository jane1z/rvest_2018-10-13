install.packages("rvest")
install.packages("stringi")
install.packages("XML")
install.packages("Rcpp")
install.packages("yaml")
install.packages("xml2")
library("rvest")
library("stringi")
library("XML")
library("Rcpp")
library("yaml")
library("xml2")
url_base <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=136315&target=after&page="
head(url_base)
for(page in 1:100){
  url <- paste(
    url_base,
    page,
    sep = '',
    encoding ="euc-kr"
  )
  htxt <- read_html(url)
  table <- html_nodes(htxt,'.list_netizen')
  content <- html_nodes(table,'.title')
  reviews <- html_text(content)
   if(length(reviews)==0){
     break;
   }
all.reviews <- c(all.reviews,reviews)
cat("\n 검색한 페이지: ",page)
}
setwd("C:\\Users\\Administrator\\rlang_weekend\\rvest")
getwd()

write.table(all.reviews, 'review.txt')

t1 <- readLines('review.txt')
t2 <- table(t1)
t3 <- head(sort(t2,decreasing = T),30)
t3





















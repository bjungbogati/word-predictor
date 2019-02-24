# load the data

bi_words <- readRDS("bi_words_fast.rds")
tri_words  <- readRDS("tri_words_fast.rds")
quad_words <- readRDS("quad_words_fast.rds")
quint_words <- readRDS("quint_words_fast.rds")
sext_words <- readRDS("sext_words_fast.rds")

# setwd("/home/bjungbogati/Desktop/Data Science/Courses/Coursera/RDataScience/Capstone/Project/app/data")
# 
# bi_words <- readRDS("./data/final2Data.RData")
# tri_words  <- readRDS("./data/final3Data.RData")
# quad_words <- readRDS("./data/final4Data.RData")


# Create N-gram matching functions

bigram <- function(input_words){
  num <- length(input_words)
  filter(bi_words, 
         word1==input_words[num]) %>% 
    top_n(5, n) %>%
    filter(row_number() == 1L) %>%
    select(num_range("word", 2)) %>%
    as.character() -> out
  ifelse(out =="character(0)", "?", return(out))
}

trigram <- function(input_words){
  num <- length(input_words)
  filter(tri_words, 
         word1==input_words[num-1], 
         word2==input_words[num])  %>% 
    top_n(5, n) %>%
    filter(row_number() == 1L) %>%
    select(num_range("word", 3)) %>%
    as.character() -> out
  ifelse(out=="character(0)", bigram(input_words), return(out))
}

quadgram <- function(input_words){
  num <- length(input_words)
  filter(quad_words, 
         word1==input_words[num-2], 
         word2==input_words[num-1], 
         word3==input_words[num])  %>% 
    top_n(5, n) %>%
    filter(row_number() == 1L) %>%
    select(num_range("word", 4)) %>%
    as.character() -> out
  ifelse(out=="character(0)", trigram(input_words), return(out))
}

quintgram <- function(input_words) {
  num <- length(input_words)
  filter(quint_words, 
         word1 == input_words[num-3], 
         word2 == input_words[num-2], 
         word3 == input_words[num-1], 
         word4 == input_words[num]) %>%
    top_n(5, n) %>%
    filter(row_number() == 1L) %>%
    select(num_range("word", 5)) %>%
    as.character() -> out
  ifelse(out == "character(0)", quadgram(input_words), return(out))
}

sextgram <- function(input_words) {
 num <- length(input_words)
 filter(sext_words,
        word1 == input_words[num-4], 
        word2 == input_words[num-3], 
        word3 == input_words[num-2], 
        word4 == input_words[num-1], 
        word5 == input_words[num]) %>%
   top_n(5, n) %>%
   filter(row_number() == 1L) %>%
   select(num_range("word", 6)) %>%
   as.character() -> out
 ifelse(out == "character(0)", quintgram(input_words), return(out))
}


ngrams <- function(input){
  # Create a dataframe
  input <- data_frame(text = input)
  # Clean the Inpput
  replace_reg <- "[^[:alpha:][:space:]]*"
  input <- input %>%
    mutate(text = str_replace_all(text, replace_reg, ""))
  # Find word count, separate words, lower case
  input_count <- str_count(input, boundary("word"))
  input_words <- unlist(str_split(input, boundary("word")))
  input_words <- tolower(input_words)
  # Call the matching functions
  
  out <- ifelse(input_count == 0, "Please input a phrase",
                ifelse(input_count == 6, sextgram(input_words),
                       ifelse(input_count == 5, quintgram(input_words), 
                              ifelse(input_count == 4, quadgram(input_words), 
                                     ifelse(input_count == 3, quadgram(input_words), bigram(input_words))))))
  
  # Output
  return(out)
}


                     



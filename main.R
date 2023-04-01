library(rainette)
library(quanteda)

# Split a character string or corpus into segments
corpus <- split_segments(data_corpus_inaugural, segment_size = 40)

# Construct a tokens object
tok <- tokens(corpus, remove_punct = TRUE)

# Select or remove tokens from a tokens object
tok <- tokens_remove(tok, stopwords("en"))

# Create a document-feature matrix (dfm)
dtm <- dfm(tok, tolower = TRUE)

# Trim a dfm using frequency threshold-based feature selection
dtm <- dfm_trim(dtm, min_docfreq = 10)

# Corpus clustering (Reinert method )
res <- rainette(dtm, k = 6, min_segment_size = 15)

# Shiny gadget for rainette clustering exploration
rainette_explor(res, dtm, corpus)

# rainette2 clustering
rainette2_explor(res, dtm, corpus)
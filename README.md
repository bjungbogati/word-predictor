# Word Predictor App
A word prediction app made with shiny. 

### How it works?
1. Enter word in textbox.
2. Predicted word appears in green
3. Question mark means no prediction

> Disclaimer : Prediction mayn't work properly because of sample set of training data 

## The Objective
- Goal is to make shiny application that predicts the next word.

- The project involves data cleaning, exploratory analysis, predicitive modeling etc to make data product.

- The text data used to predict the next words is imported from HC Corpora.

- The text mining and natural language processing was done using R programming.

The Applied Methods
- First, we create sample data from the HC Corpora data, which was cleaned (lowercasing, remove special characters, links etc)

- Then, data sample was then tokenized into so-called n-grams.

- An n-gram means a contiguous sequence of “n items”“ from a given sequence of text or speech.

- Those aggregated bi-gram, tri-garm and quad-gram term frequency matrices are transferred to frequency dictionaries.

- The resulting data.frames are used to predict the next word with the help of frequencies of the underlying n-grams table.

## The Predction Technique:
Using Back-Off algorithm, we'll predict the next word from a user input:

- First, a 4Ns-Gram will be used (user's last 3 input words should match the 4Ns-Gram first three.)
- If no 4Ns-Gram matches, Back-Off to 3Ns-Gram'll be used (user's last 2 input words should match the 3Ns-Gram ones.)
- If no 3Ns-Gram matches, Back-Off to 2Ns-Gram'll be used (user's last word should match the 2Ns-Gram first one.)
- If no 2Ns-Gram matches, Back-Off to the highest frequent words.

## Additional Information
Word prediction app is hosted on shinyapps.io:

The project pitch is hosted : Word Prediction

Learn more about the Coursera Data Science Specialization: https://www.coursera.org/specialization/jhudatascience/1

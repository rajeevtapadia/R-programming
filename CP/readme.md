**README**

## Project Title: Spotify song hit prediction using modified algorithm of logistic regression and gradient decent

### Overview:
This project aims to predict the popularity of Spotify tracks based on various features using logistic regression. Two different methods are using for impementing logistic regression.
In the first one we use the default sigmoid function and train the model using `glm` function. In the second one has a modified algorithm that uses `tanh()` function and gradiend decent to train the model. The dataset used for this analysis contains information about track features such as danceability, energy, loudness, acousticness, instrumentalness, and others.

### Files:
- `spotify_dataset.csv`: CSV file containing the Spotify track data.
- `Spotify song hit prediction.R`: R code to create logistic regression model using gradient decent and hyperbolic tangent function.
- `sigmoid.R`: R code to create logistic regression model using the default sigmoid function.

### Libraries Used:
- `dplyr`: For data manipulation.
- `ggplot2`: For data visualization.
- `caret`: For creating training and testing datasets.
- `stats`: For building the logistic regression model.

### Data Preprocessing:
- Popularity values are normalized to a range between 0 and 1.
- Classes of popular and not popular are balanced.
- Zero value in popularity are removed

### Model Building:
- Instead of using the default logistic function (sigmoid), a custom function is defined using the hyperbolic tangent function for model fitting.
- Features such as danceability are used to predict the popularity of tracks.

### Evaluation:
- Model performance is evaluated using accuracy, precision, and recall.
- Confusion matrix is generated to assess the classification results.
- ROC graph is created and AUC is calculated.

### Results:
- The trained logistic regression model using hyperbolic tangent function achieves a certain accuracy, precision, and recall in predicting the popularity of Spotify tracks than the default sigmoid function.

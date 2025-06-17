# Base R Shiny image
FROM rocker/shiny

# Make a directory in the container
RUN mkdir /home/herokutestapp

# Install R dependencies
RUN R -e "install.packages(c('dplyr', 'ggplot2', 'gt'))"

# Copy the Shiny app code
COPY server.R /home/herokutestapp/server.R
COPY ui.R /home/herokutestapp/ui.R
COPY run.R /home/herokutestapp/run.R

# Expose the application port
EXPOSE 8180

# Run the R Shiny app
CMD Rscript /home/herokutestapp/run.R
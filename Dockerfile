FROM rocker/r-ver

# Install additional R packages
RUN R -e 'install.packages(c("plumber", "devtools"))'
RUN R -e 'devtools::install_github("uriahf/rtichoke", ref = "support_python_users")'

# Copy your R code into the container
WORKDIR /app
COPY . .

# Expose the REST API on port 4242
EXPOSE 4242

# Start the REST API
# ENTRYPOINT [ "Rscript --vanilla /app/main.R" ]
CMD ["Rscript", "-e", "source('/app/main.R')"]


#Set your theme default here
theme <- 'Clouds Midnight'

#update if using a different user than rstudio (which is default)
users_rprof <- "/home/rstudio/.Rprofile"


## DO NOT EDIT
rprof_command <- paste0("
if (interactive() && requireNamespace(\"rsthemes\", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_dark(\"",theme,"\") # dark theme

  # Whenever the R session restarts inside RStudio...
  setHook(\"rstudio.sessionInit\", function(isNewSession) {
    #generically apply dark theme
    rsthemes::use_theme_dark()
    
  }, action = \"append\")
}
")

cat(file = users_rprof,
    rprof_command, 
    append = TRUE)

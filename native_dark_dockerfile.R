
## remotes::install_github("thebioengineer/dockyard")
library(dockyard)

df <- dockerfile() %>% 
  from("rocker/rstudio") %>% # set the rocker docker version and base you want
  update() %>% 
  install_r_lib("remotes") %>%
  run("R -e 'remotes::install_github(\"r-lib/cli\")'",new = TRUE) %>% 
  run("R -e 'remotes::install_github(\"gadenbuie/rsthemes\")'") %>% 
  run("R -e 'rsthemes::install_rsthemes(destdir = \"/home/rstudio/.R/rstudio/themes\")'",new = TRUE) %>% 
  copy("add_themes.R",".") %>% 
  run("Rscript add_themes.R") %>% 
  write_dockerfile("themed_rstudio_dockerfile",overwrite = TRUE)

build(df, "theme_rstudio",verbose = TRUE,)

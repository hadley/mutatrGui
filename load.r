# l(mutatr)
# source("~/documents/oo/mutatr-gui/gui-load.r", chdir = T)
library(gWidgets)

# TO DO
#   * checkbox
#   * checkboxgroup
#   * edit
#   * image
#   * layout
#   * menu
#   * notebook
#   * panedgroup
#   * radio
#   * separator
#   * slider
#   * table
#   * text
#   * tree
source("R/gui-widget.r")

source("R/gui-window.r")
source("R/gui-button.r")
source("R/gui-group.r")
source("R/gui-label.r")
source("R/gui-status-bar.r")
source("R/gui-combobox.r")
source("R/gui-checkbox.r")

# Advantages:
#   * don't have to worry about polluting global namespace
#   * hierarchy of object names exactly matches gui hierarchy
#   * indenting matches gui hierarchy
#   * can use lexical scoping for private/local functions/variables

w2 <- Window$clone()$do({
  self$status <- StatusBar$clone()
  self$title <- "Hello"
  
  self$buttons <- Group$clone("v")$do({
    self$add(Label$clone("These are some <b>buttons</b>"))
    # When you don't want to access later
    self$add(Button$clone("One")$
      add_handler("on_click", function(...) print("hi"))
    )
    self$add_spring()
    # When you do want to access later
    self$two <- Button$clone("Two")
    self$add_space(10)
    self$three <- Button$clone("Three")
  })
  
})  

w2$show()
w2$buttons$two$label <- "2"


# Method chaining approach - interesting but probably won't promote as
# default choice.
w <- Window$clone()$do({
  self$title <- "Hello"
  
  self$buttons <- Group$clone("v")$
    add(Button$clone("One")$
      add_handler("on_click", function(...) print("hi"))
    )$
    add_spring()$
    add(Button$clone("Two"))$
    add_space(10)$
    add(Button$clone("Three"))
})
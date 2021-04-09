#' Get some data storytelling inspiration
#'
#' This functions returns a random URL of data storytelling inspiration based on our contributed list. Users can specify author, affiliation, topic, or type if they wish. If \code{open = TRUE} and the session is interactive, then the URL will be opened in the user's browser.
#'
#' @param author optional parameter to specify desired author of returned content
#' @param affiliation optional parameter to specify desired affiliation of content
#' @param topic optional parameter to specify desired topic of returned content
#' @param type optional parameter to specify desired type of returned content
#' @param open whether to open the URL in a browser. Defaults to \code{FALSE}
#' @return A URL
#' @export
inspire_me <- function(author = "", affiliation = "", topic = "", type = "", open = FALSE) {
  data <- utils::read.table(
    text = readLines(system.file("extdata", "links.csv", package = "inspiRe"), warn = FALSE),
    header = TRUE,
    sep = ",",
    stringsAsFactors = FALSE
  )

  if (author != "") {
    data <- subset(data, grepl(author, author_name, ignore.case = TRUE))
  }

  if (affiliation != "") {
    data <- subset(data, grepl(affiliation, author_affiliation, ignore.case = TRUE))
  }

  if (topic != "") {
    data <- subset(data, grepl(topic, content_topic, ignore.case = TRUE))
  }

  if (type != "") {
    data <- subset(data, grepl(type, content_type, ignore.case = TRUE))
  }

  num_inspire <- nrow(data)

  if (num_inspire == 0) {
    return("Sorry, there are no inspirations with your specifications. Try different specifications.")
  } else {
    idx <- sample(1:num_inspire, 1)
    url <- data$url[idx]
  }

  if (interactive() & open) {
    utils::browseURL(
      url = url,
      browser = getOption("browser")
    )
  }

  return(url)
}

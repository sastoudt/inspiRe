#' Get some data storytelling inspiration
#'
#' This functions returns a random URL of data storytelling inspiration based on our contributed list. Users can specify author, affiliation, topic, or type if they wish.
#'
#' @param author optional parameter to specify desired author of returned content
#' @param affiliation optional parameter to specify desired affiliation of content
#' @param topic optional parameter to specify desired topic of returned content
#' @param type optional parameter to specify desired type of returned content
#' @return A URL
#' @export
inspire_me <- function(author = "", affiliation = "", topic = "", type = "") {
  data <- pkgcond::suppress_warnings(utils::read.csv(system.file("extdata", "links.csv", package = "inspiRe"), stringsAsFactors = F), "incomplete final line")

  if (author != "") {
    data <- subset(data, author_name == author)
  }

  if (affiliation != "") {
    data <- subset(data, author_affiliation == affiliation)
  }

  if (topic != "") {
    data <- subset(data, content_topic == topic)
  }

  if (type != "") {
    data <- subset(data, content_type == type)
  }

  num_inspire <- nrow(data)

  if (num_inspire == 0) {
    return("Sorry, there are no inspirations with your specifications. Try different specifications.")
  } else {
    idx <- sample(1:num_inspire, 1)
    return(data$url[idx])
  }
}

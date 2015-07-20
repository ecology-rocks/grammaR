#' Extract Text Between Any Brackets
#'
#' This is a function shamelessly pirated from the internet. It accepts a txt
#' string, and br, which says the types of brackets to search within.
#'
#' @param txt The text string
#' @param br The type of bracket. Accepts (, [, {, or "all"
#' @param with Normally set to F, if T then brackets will be included with the
#'   return text.
#'
#' @return This function returns all text found within brackets.
#'

bracketXtract <-
  function(txt, br = c("(", "[", "{", "all"), with=FALSE)
  {
    br <- match.arg(br)
    left <-        # what pattern are we looking for on the left?
      if ("all" == br) "\\(|\\{|\\["
    else sprintf("\\%s", br)
    map <-         # what's the corresponding pattern on the right?
      c(`\\(`="\\)", `\\[`="\\]", `\\{`="\\}",
        `\\(|\\{|\\[`="\\)|\\}|\\]")
    fmt <-         # create the appropriate regular expression
      if (with) "(%s).*?(%s)"
    else "(?<=%s).*?(?=%s)"
    re <- sprintf(fmt, left, map[left])
    regmatches(txt, gregexpr(re, txt, perl=TRUE))    # do it!
  }

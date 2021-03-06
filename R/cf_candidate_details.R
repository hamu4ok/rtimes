#' Campaign finance NYTimes API - candidate details
#' 
#' See \url{http://developer.nytimes.com/docs/campaign_finance_api/}
#' 
#' @import jsonlite httr 
#' @export
#' @template finance
#' @template nyt
#' @param fec_id FEC id
#' @examples \dontrun{
#' cf_candidate_details(campaign_cycle = 2008, fec_id = 'P80003338')
#' }

`cf_candidate_details` <- function(campaign_cycle=NULL, fec_id=NULL, 
                                   key=getOption("nytimes_cf_key"), callopts=list())
{
  url <- sprintf("http://api.nytimes.com/svc/elections/us/v3/finances/%s/candidates/%s.json", campaign_cycle, fec_id)
  args <- rtimes_compact(list(`api-key`=key))
  ans <- GET(url, query = args, callopts)
  stop_for_status(ans)
  tt <- content(ans, as = "text")
  jsonlite::fromJSON(tt, simplifyVector = FALSE)
}
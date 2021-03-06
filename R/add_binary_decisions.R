#' @include internal.R Parameters-proto.R Decision-proto.R
NULL

#' Add Binary Decisions
#'
#' Add a binary decision to a conservation planning \code{\link{problem}}.
#' This is the classic decision of either prioritizing or not prioritizing a
#' planning unit. Typically, this decision has the assumed action of buying
#' the planning unit to include in a protected area network. If no decision is
#' added to a problem then this decision class will be used by default.
#'
#' @param x \code{\link{ConservationProblem-class}} object.
#'
#' @details
#' Conservation planning problems involve making decisions on planning units.
#' These decisions are then associated with actions (e.g. turning a planning
#' unit into a protected area). If no decision is explicitly added to a problem,
#' then the binary decision class will be used by default. Only a single
#' decision should be added to a \code{ConservationProblem} object. \strong{If
#' multiple decisions are added to a problem object, then the last one to be
#' added will be used.}
#'
#' @return \code{\link{Decision-class}} object.
#'
#' @seealso \code{\link{decisions}}.
#'
#' @examples
#' # create problem with binary decisions
#' p <- problem(sim_pu_raster, sim_features) %>%
#'      add_min_set_objective() %>%
#'      add_relative_targets(0.1) %>%
#'      add_binary_decisions()
#' \donttest{
#' # solve problem
#' s <- solve(p)
#'
#' # plot solutions
#' plot(s, main = "solution")
#' }
#'
#' @name add_binary_decisions
NULL

#' @rdname add_binary_decisions
#' @export
add_binary_decisions <- function(x) {
  # assert argument is valid
  assertthat::assert_that(inherits(x, "ConservationProblem"))
  # add decision
  x$add_decisions(pproto("BinaryDecision", Decision,
                         name = "Binary decision",
                         apply = function(self, x) {
                           assertthat::assert_that(inherits(x,
                                                   "OptimizationProblem"))
                           invisible(rcpp_apply_binary_decisions(x$ptr))
                         }
  ))
}

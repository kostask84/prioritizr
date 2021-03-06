% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_binary_decisions.R
\name{add_binary_decisions}
\alias{add_binary_decisions}
\alias{add_binary_decisions}
\title{Add Binary Decisions}
\usage{
add_binary_decisions(x)
}
\arguments{
\item{x}{\code{\link{ConservationProblem-class}} object.}
}
\value{
\code{\link{Decision-class}} object.
}
\description{
Add a binary decision to a conservation planning \code{\link{problem}}.
This is the classic decision of either prioritizing or not prioritizing a
planning unit. Typically, this decision has the assumed action of buying
the planning unit to include in a protected area network. If no decision is
added to a problem then this decision class will be used by default.
}
\details{
Conservation planning problems involve making decisions on planning units.
These decisions are then associated with actions (e.g. turning a planning
unit into a protected area). If no decision is explicitly added to a problem,
then the binary decision class will be used by default. Only a single
decision should be added to a \code{ConservationProblem} object. \strong{If
multiple decisions are added to a problem object, then the last one to be
added will be used.}
}
\examples{
# create problem with binary decisions
p <- problem(sim_pu_raster, sim_features) \%>\%
     add_min_set_objective() \%>\%
     add_relative_targets(0.1) \%>\%
     add_binary_decisions()
\donttest{
# solve problem
s <- solve(p)

# plot solutions
plot(s, main = "solution")
}

}
\seealso{
\code{\link{decisions}}.
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color.R
\name{color_graph}
\alias{color_graph}
\alias{color_dsatur}
\alias{color_msc}
\alias{color_lmxrlf}
\alias{color_hybrid_lmxrlf_tabucol}
\alias{color_hybrid_dsatur_tabucol}
\alias{color_tabucol}
\title{Color nodes using Graph Coloring Algorithm}
\usage{
color_dsatur()

color_msc()

color_lmxrlf()

color_hybrid_lmxrlf_tabucol()

color_hybrid_dsatur_tabucol()

color_tabucol(k, tabu_size = 25, rep = 100, nbmax = 1000)
}
\arguments{
\item{k}{number of colors to use for graph coloring}

\item{tabu_size}{size of tabu list}

\item{rep}{number of inner iterations}

\item{nbmax}{maximum number of non-improving outer iterations}
}
\description{
These functions are \code{\link{tidygraph}} wrapper around the various \link[=graph_coloring]{graph coloring algorithms}.
They automatically use the graph that is being computed on, and
otherwise passes on its arguments to the relevant coloring function. The return value is always
a integer vector of assigned color index so that neighboring nodes never share the same color.
}
\section{Functions}{
\itemize{
\item \code{color_dsatur}: Color graph using \code{\link[=graph_coloring_dsatur]{graph_coloring_dsatur()}}

\item \code{color_msc}: Color graph using \code{\link[=graph_coloring_msc]{graph_coloring_msc()}}

\item \code{color_lmxrlf}: Color graph using \code{\link[=graph_coloring_lmxrlf]{graph_coloring_lmxrlf()}}

\strong{WARNING} Algorithm is unstable and requires additional testing

\item \code{color_hybrid_lmxrlf_tabucol}: Color graph using \code{\link[=graph_coloring_hybrid_lmxrlf_tabucol]{graph_coloring_hybrid_lmxrlf_tabucol()}}

\strong{WARNING} Algorithm is unstable and requires additional testing

\item \code{color_hybrid_dsatur_tabucol}: Color graph using \code{\link[=graph_coloring_hybrid_dsatur_tabucol]{graph_coloring_hybrid_dsatur_tabucol()}}

\item \code{color_tabucol}: Color graph using \code{\link[=graph_coloring_tabucol]{graph_coloring_tabucol()}}
}}

\examples{
library(tidygraph)

if (requireNamespace("ggraph", quietly = TRUE)) {
  library(ggraph)
  set.seed(42)

  play_islands(5, 10, 0.8, 3) \%>\%
    mutate(color = as.factor(color_dsatur())) \%>\%
    ggraph(layout = 'kk') +
    geom_edge_link(aes(alpha = ..index..), show.legend = FALSE) +
    geom_node_point(aes(color = color), size = 7) +
    theme_graph("")
}
}

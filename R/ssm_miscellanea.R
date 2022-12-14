expected_cl_py <- function(n, sigma, alpha) {
  n <- as.integer(n)
  if (sigma < 1e-6) {
    out <- alpha * (digamma(alpha + n) - digamma(alpha))
  } else {
    out <- 1 / sigma * exp(lgamma(alpha + sigma + n) - lgamma(alpha + sigma) - lgamma(alpha + n) + lgamma(alpha + 1)) - alpha / sigma
  }

  return(out)
}

expected_cl_py <- Vectorize(expected_cl_py, vectorize.args = "n")


expected_m_dp <- function(r, n, alpha) {
  out <- log(alpha) + lchoose(n, r) + lgamma(r) + lgamma(alpha + n - r) - lgamma(alpha + n)
  exp(out)
}
expected_m_dp <- Vectorize(expected_m_dp, vectorize.args = "r")

expected_m_py <- function(r, n, sigma, alpha) {
  out <- log(alpha) + lchoose(n, r) + lgamma(r - sigma) - lgamma(1 - sigma) - lgamma(alpha + n) + lgamma(alpha) + lgamma(alpha + sigma + n - r) - lgamma(alpha + sigma)
  exp(out)
}

expected_m_py <- Vectorize(expected_m_py, vectorize.args = "r")

extrapolate_cl_py <- function(m, K, n, sigma, alpha) {
  n <- as.integer(n)
  if (sigma < 1e-6) {
    out <- alpha * (digamma(alpha + n + m) - digamma(alpha)) - alpha * (digamma(alpha + n) - digamma(alpha)) + K
  } else {
    out <- (K + alpha / sigma) * (exp(lgamma(alpha + n + sigma + m) - lgamma(alpha + n + sigma) - lgamma(alpha + n + m) + lgamma(alpha + n)) - 1) + K
  }

  return(out)
}


extrapolate_cl_py <- Vectorize(extrapolate_cl_py, vectorize.args = "m")


#' freq_of_freq <- function(dataset, rel = FALSE, plot = FALSE) {
#'   if (is.null(dim(dataset))) dataset <- matrix(dataset, nrow = 1)
#'
#'   K <- max(dataset)
#'   tab <- matrix(0, nrow(dataset), K)
#'   rownames(tab) <- rownames(dataset)
#'   colnames(tab) <- 1:K
#'   for (i in 1:nrow(dataset)) {
#'     abundances <- dataset[i, ]
#'     abundances <- factor(abundances[abundances > 0], levels = 1:K)
#'     tab[i, ] <- as.numeric(table(abundances))
#'     if (rel) tab[i, ] <- tab[i, ] / length(abundances)
#'   }
#'   tab <- t(tab)
#'
#'   if (plot) {
#'     data_plot <- reshape2::melt(tab)
#'     data_plot$value[data_plot$values == 0] <- NA
#'     colnames(data_plot)[2] <- "Sample"
#'
#'     p <- ggplot(data = data_plot, aes(x = Var1, y = value, col = Sample)) +
#'       geom_point(size = 0.8, alpha = 0.5) +
#'       geom_smooth(size = 0.8, se = F) +
#'       scale_y_log10() +
#'       scale_x_log10() +
#'       theme_bw() +
#'       xlab("Frequency") +
#'       ylab("Frequency of abundances")
#'     return(p)
#'   }
#'   c(tab)
#' }

if (interactive()) {

  # colors for themes
  if (file.exists("~/.palette-name.vim")) {

    # define colors
    .palname <- system("cat ~/.palette-name.vim", intern = TRUE)
    .my_cols <- system(paste0("cat ~/.palettes/", .palname), intern = TRUE)
    .my_cols <- .my_cols[.my_cols != ""][1:9]

    # set plot colors
    setHook("plot.new",
            function(...) graphics::par(fg = .my_cols[2], col.axis = .my_cols[2],
                                        col.lab = .my_cols[2], col.main = .my_cols[2]))

    # set ggplot2 colors
    setHook(packageEvent("ggplot2", "onLoad"),
            function (...) {
              theme_bg <- grDevices::colorRampPalette(c("white", .my_cols[1]))(100)[90]
              strip_bg <- grDevices::colorRampPalette(c("white", .my_cols[1]))(100)[80]
              my_theme <- ggplot2::theme_grey(24) +
                ggplot2::theme(
                  rect = ggplot2::element_rect(fill = .my_cols[1]),
                  text = ggplot2::element_text(colour = .my_cols[2]),
                  plot.background = ggplot2::element_rect(fill = .my_cols[1],
                                                          colour = .my_cols[1]),
                  panel.background = ggplot2::element_rect(fill = theme_bg),
                  panel.grid = ggplot2::element_line(colour = .my_cols[1]),
                  # panel.border = ggplot2::element_rect(fill = NA,
                  #colour = .my_cols[2]),
                  axis.text = ggplot2::element_text(colour = .my_cols[2]),
                  strip.background = ggplot2::element_rect(fill = strip_bg),
                  strip.text = ggplot2::element_text(colour = .my_cols[2])
                  # text = ggplot2::element_text(colour = .my_cols[2])
                  )
              ggplot2::theme_set(my_theme)
            })

    # X11 options
    setHook(packageEvent("grDevices", "onLoad"),
            function (...) grDevices::X11.options(width = 16, height = 16,
                                                  xpos = 0, pointsize = 20,
                                                  type = "cairo", canvas = .my_cols[1]))

  } else {

    # X11 options
    setHook(packageEvent("grDevices", "onLoad"),
            function (...) grDevices::X11.options(width = 16, height = 16,
                                                  xpos = 0, pointsize = 20,
                                                  type = "cairo"))

  }

  # terminal colors
  library(colorout)
  setOutputColors(normal = NA, negnum = 2, zero = 3, number = 3, date = 2,
    string = 6, const = 1, false = c(1, NA, 2), true = c(1, NA, 1), infinite = 5,
    stderror = 4, warn = c(1, NA, 1), error = c(1, NA, 1), verbose = FALSE,
    zero.limit = NA)

  # quit without saving workspace
  q <- function (save = "no", ...) quit(save = save, ...)

  # terminal width initial and function
  if (!nzchar(Sys.getenv("RSTUDIO_USER_IDENTITY"))) {
    options(width = system("tput cols", intern = TRUE))
    .width <- function (...) options(width = system("tput cols", intern = TRUE))
  }

  # openblas.set.num.threads <- inline::cfunction(signature(ipt = "integer"),
  #   body = "openblas_set_num_threads(*ipt);",
  #   otherdefs = c ("extern void openblas_set_num_threads(int);"),
  #   libargs = c ("-L/opt/openblas/lib -lopenblas"),
  #   language = "C",
  #   convention = ".C"
  #   )

  # openblas.set.num.threads(4)

  # rstan::rstan_options(auto_write = TRUE)
  # options(mc.cores = 4)
  # options(languageserver.default_linters = lintr::with_defaults(
  #     line_length_linter = lintr::line_length_linter(100),
  #     object_length_linter = NULL,
  #     object_name_linter = NULL,
  #     commented_code_linter = NULL
  # ))
  #
}

# if(interactive()){
#        # Suggested libraries:
#        library(colorout)
#
#        # Use text based web browser to navigate through R docs after help.start()
#        # if you cannot run a graphical web browser (e.g. when you are in the
#        # Linux console):
#         if(Sys.getenv("DISPLAY") == ""){
#             if(Sys.getenv("TMUX") != "")
#                 options(browser = function(u) system(paste0("tmux new-window 'w3m ", u, "'")))
#             else if(Sys.getenv("NVIMR_TMPDIR") != "")
#                 options(browser = function(u) .C("nvimcom_msg_to_nvim",
#                                                  paste0('StartTxtBrowser("w3m", "', u, '")')))
#         }
# }

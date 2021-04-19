var gulp = require("gulp");
var htmlmin = require("gulp-htmlmin");
var shell = require("gulp-shell");

gulp.task("hugo-build", shell.task(["hugo --environment production"]));

gulp.task("minify", () => {
  return gulp
    .src(["public/**/*.html"])
    .pipe(
      htmlmin({
        collapseWhitespace: true,
        minifyCSS: true,
        minifyJS: true,
        removeComments: true,
        useShortDoctype: true,
      })
    )
    .pipe(gulp.dest("./public"));
});

gulp.task("build", gulp.series("hugo-build", "minify"));

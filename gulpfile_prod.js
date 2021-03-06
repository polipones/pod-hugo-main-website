var gulp = require("gulp");
var htmlmin = require("gulp-htmlmin");
var shell = require("gulp-shell");

gulp.task("fetch_contacts", shell.task(["sh scripts/fetch_contacts.sh"]));

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

gulp.task("build", gulp.series("fetch_contacts", "hugo-build", "minify"));

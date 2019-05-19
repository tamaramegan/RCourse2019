data("mtcars")

ggplot(mtcars, aes(wt, qsec))+
  geom_point()

ggplot(mtcars, aes(wt, qsec))+
  geom_point(color = "blue")

ggplot(mtcars, aes(wt, qsec))+
  geom_point(aes(color = cyl))

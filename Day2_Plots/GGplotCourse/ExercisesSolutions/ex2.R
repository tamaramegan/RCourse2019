data("mtcars")

ggplot(mtcars, aes(gear, mpg))+
  geom_boxplot()
ggsave("ex2-1.pdf")

ggplot(mtcars, aes(gear, mpg))+
  geom_boxplot()+geom_point()
ggsave("ex2-2.pdf")

ggplot(mtcars, aes(wt, hp))+
  geom_point()
ggsave("ex2-3.pdf")

ggplot(mtcars, aes(wt, hp))+
  geom_point()+geom_smooth(method = "lm")
ggsave("ex2-4.pdf")


ggplot(mtcars, aes(wt, qsec))+
  geom_point(aes(color = cyl))



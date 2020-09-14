library(ggraph)
library(ggplot2)

a <- ggplot(ComputationalResources, aes(fill=Metric, y=log(Value), x=Tool)) + 
  geom_bar(position="dodge", stat="identity") + ggtitle("Computational Resorces")
plot(a)
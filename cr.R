library(ggraph)
library(ggplot2)
library(reshape2)

# a <- ggplot(ComputationalResources, aes(fill=Metric, y=log(Value), x=Tool)) + 
#   geom_bar(position="dodge", stat="identity") + ggtitle("Computational Resources HTMCP")
# plot(a)

df_melt <- reshape2::melt(resources[,c(1,4,5)], id.var=c('Procedure', 'num_vars'))
#a <- ggplot(df_melt, aes(x = num_vars, y = log10(value), colour = Resource, shape = Procedure)) + 
#  geom_point() + xlab('Number of Variants') + ggtitle("Computational Resources") + 
#  ylab("value (log10)") 
a <- ggplot(df_melt, aes(x = num_vars, y = value / 1000, colour = Procedure)) + 
  geom_point() + xlab('Number of Variants') + ggtitle("Max Memory") + 
  ylab("Max Memory in GB") 
a <- a + geom_hline(aes(yintercept= 3.1, linetype = "LoFreq"), colour= 'red') +
     geom_hline(aes(yintercept= 4.51, linetype = "Shimmer"), colour= 'blue') +
     geom_hline(aes(yintercept= 1573.50, linetype = "Mutect2"), colour= 'green') +
     geom_hline(aes(yintercept= 53.89, linetype = "Virmid"), colour= 'purple') +
     geom_hline(aes(yintercept= 4.98, linetype = "Strelka2"), colour= 'orange') +
     scale_linetype_manual(name = "Tools", values = c(2, 2, 2, 2, 2), 
                           guide = guide_legend(override.aes = list(color = c('red', 'green', 'blue', 
                                                                              'orange', 'purple'))))
plot(a)


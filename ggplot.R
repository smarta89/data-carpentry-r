ggplot(data=interviews_plotting)
#starts new plot
ggplot(data=interviews_plotting,
       aes(x=no_membrs, y=number_items))
#labeled axis
ggplot(data=interviews_plotting,
       aes(x=no_membrs, y=number_items))+
  geom_point()
#made scatterplot (above) make seperate graph(below)
interviews_plot<-ggplot(data=interviews_plotting,
                        aes(x=no_membrs, y=number_items))
interviews_plot<-ggplot(data=interviews_plotting,
                        aes(x=no_membrs, y=number_items))+geom_point()
#now to make it pretty - scatterplot
interviews_plot+geom_point(alpha=0.5)
interviews_plot+geom_jitter(alpha=0.5)
interviews_plot+geom_jitter(alpha=0.5,color="blue")
interviews_plot+geom_jitter(aes(shape=village),alpha=0.5)#gives us a legend with each village as dif shapes or colours if you put colour

#another example
ggplot(data=interviews_plotting,aes(x=village,y=rooms))+geom_jitter(aes(color=respondent_wall_type)) #again can swap color and shape

#boxplot
ggplot(data=interviews_plotting,aes(x=respondent_wall_type,y=rooms))+
  geom_boxplot()

#box and scatter together
ggplot(data=interviews_plotting,aes(x=respondent_wall_type,y=rooms))+
  geom_boxplot(alpha=0)+geom_jitter(alpha=0.5,color="tomato")

#making it plain for science
ggplot(data=interviews_plotting,aes(x=respondent_wall_type,y=rooms))+
  geom_boxplot(alpha=0)+geom_jitter(alpha=0.5,color="tomato")+theme_classic()


create_plot_age <- function(df, x_var, x_label, Age){
  if (Age){
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity") +
      labs( x = x_label,
            y = "Relative Abundance",
            title = "All Microbiomes by Diet & Age")+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      guides(fill = guide_legend(ncol = 1))
  
  } else {
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity")+
      labs( x = x_label,
            y = "Relative Abundance",
            title = "All Microbiomes by Diet & Age")+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      guides(fill = guide_legend(ncol = 1))
  }

}


create_plot_gender <- function(df, x_var, x_label, Age, Gender){
  if (length(Gender) == 2){
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity") +
      facet_wrap(~Gender)+
      labs( x = x_label,
            y = "Relative Abundance",
            title = "Microbiomes by Diet, Age, and Gender")+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      guides(fill = guide_legend(ncol = 1))
    
  } else {
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity")+
      labs( x = x_label,
            y = "Relative Abundance",
            title = "Microbiomes by Diet, Age, and Gender")+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))+
      guides(fill = guide_legend(ncol = 1))
  }
  
}

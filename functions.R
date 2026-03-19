
create_plot <- function(df, x_var, x_label, Age){
  if (Age){
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity") +
      labs( x = x_label,
            y = "Relative Abundance")+
      theme_bw()
  } else {
    ggplot(data = df, aes(fill=genus, y=relative_abundance, x=diet)) +
      geom_bar(position="fill", stat="identity")+
      labs( x = x_label,
            y = "Relative Abundance")+
      theme_bw()
  }
}


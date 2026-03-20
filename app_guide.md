# Quick Reference

This shiny app is used to view relative abundance data for human gut microbiomes. This data was from a study comparing the gut microbiomes of infants that were fed either breast milk, formula, or supplemented formula. 

[Shiny Gallery for Quick Reference](https://shiny.posit.co/r/gallery/)

### Layout description
slider to select age input 
graph showing the relative abundance as a stacked bar plot for each parameter selected

![My Layout](App_layout.png)


### Inputs
The bullets below take the general form:

> shiny Component  |  **variable_name** | optional: args

> selectizeinput  |  **select** | multiple = TRUE

> selectinput |  **Age** | 2,4,6,12

> checkboxGroupInput  |  **Gender** | inline = TRUE

### Outputs
The bullets below take the general form:

> Shiny Component  |  **variable_name**  | (inputs required)  | optional: function used

> renderPlot  |  **plot1**  |   create_plot_age(df$data, x_var, x_label, input$Age)  | create_plot_age 

>  renderPlot  |  **plot2**  | create_plot_gender(df$data, x_var, x_label, input$Age, input$Gender)  | create_plot_gender 



### Reactive components and Server

> component type | **variable_name(s)** | Events that trigger 

reactiveValues(data = filtered_merged_trans) | **filtered_merged_trans** | calls the dataframe when the app runs 

observeEvent(c(input$Age, input$select, input$Gender | **filtered_merged_trans** | occurs when the user selects the diet, age, or gender checkboxes




### Functions and Set up

> **create_plot_age <- function(df, x_var, x_label, Age)**  |  (df, x_var, x_label, Age)  | creats the primary plot 

> **create_plot_gender <- function(df, x_var, x_label, Age, Gender)**  |  (df, x_var, x_label, Age, Gender)  | creates the additional plot that appears when genders are selected



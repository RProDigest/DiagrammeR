library(DiagrammeR)

grViz("
digraph TakealotShinyApp {
  
  graph [layout = dot, rankdir = TB]
  
  node [shape = rectangle, style = filled, fillcolor = lightyellow, fontsize = 12]
  
  Startup [label = 'Start App & Load Models']
  Upload [label = 'Upload Cleaned CSV']
  Segmentation [label = 'Tab 1:\nKMeans Customer Segmentation']
  DatasetView [label = 'Tab 2:\nDataset Preview']
  Prediction [label = 'Tab 3:\nXGBoost Purchase Prediction']
  SHAP [label = 'SHAP Feature Importance']
  Visuals [label = 'Cluster & SHAP Visualizations']

  Startup -> Upload
  Upload -> Segmentation
  Upload -> DatasetView
  Upload -> Prediction
  Prediction -> SHAP
  Segmentation -> Visuals
  SHAP -> Visuals
}
")



library(DiagrammeR)

grViz("
digraph takealot_shiny_workflow {
  
  graph [layout = dot, rankdir = LR]
  
  node [shape = rectangle, style = filled, fontname = Helvetica, fontsize = 12, color = black, fillcolor = lightblue]
  
  A [label = 'Start App\n& Load Models']
  B [label = 'Upload Cleaned Dataset']
  C [label = 'Tab 1:\nKMeans Segmentation']
  D [label = 'Tab 2:\nDataset Preview']
  E [label = 'Tab 3:\nPurchase Prediction']
  F [label = 'SHAP Analysis']
  G [label = 'Visual Insights &\nModel Output']
  
  edge [color = gray40, penwidth = 1.2]
  
  A -> B
  B -> C
  B -> D
  B -> E
  E -> F
  C -> G
  D -> G
  F -> G
  
}
")


#################################################################################
#Name: Mubanga Nsofu
#Date: 2025-06-20
# Module: BAN6800
# Description: Diagram for Takealot Shiny App Workflow
# Purpose: Visualize the workflow of a Shiny app for customer segmentation and purchase prediction
# Institution: Nexford University
################################################################################


if (!require(pacman)) {
  install.packages("pacman") # Check if package manager is installed 
}

# Manage the installation and loading of pdftools, tidyverse and the dependencies

pacman::p_load(DiagrammeR, 
               DiagrammeRsvg, 
               rsvg)

# Create a diagram for the Takealot Shiny app workflow


grViz("
digraph takealot_shiny_app {

  graph [layout = dot, rankdir = TB, fontsize = 10]

  node [shape = box, style = filled, fontname = 'Calibri', fontsize = 12, color = black, penwidth = 1.5]

  // Nodes
  A [label = '🚀 Launch App & Load Models', fillcolor = '#DFF0D8']
  B [label = '📂 Upload Cleaned Dataset', fillcolor = '#D9EDF7']
  C [label = '📊 Tab 1:\nKMeans Segmentation', fillcolor = '#F2DEDE']
  D [label = '📄 Tab 2:\nDataset Preview', fillcolor = '#FCF8E3']
  E [label = '🤖 Tab 3:\nPurchase Prediction', fillcolor = '#D9EDF7']
  F [label = '🧠 SHAP Analysis\n(Feature Importance)', fillcolor = '#E6E6FA']
  G [label = '📈 Visual Insights & Output', fillcolor = '#DFF0D8']

  edge [color = gray30, penwidth = 1.2]
  A -> B
  B -> C
  B -> D
  B -> E
  E -> F
  C -> G
  D -> G
  F -> G

  // Caption node
  caption [label = '🛠️ Coded by M.Nsofu using R. Code is @ https://github.com/mubangansofu/takealot_shopper_insights',
           shape = plaintext, fontsize = 10, fontcolor = gray35, style = 'italic']

  G -> caption [style=invis]
}
")


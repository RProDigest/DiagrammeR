#################################################################################
#Name: Mubanga Nsofu
#Date: 2025-06-20
# Module: BAN6800
# Description: Diagram for Takealot Shiny App Design
# Purpose: Visualize the Design of the Shiny app for customer segmentation and purchase prediction
# Institution: Nexford University
################################################################################

if (!require(pacman)) {
  install.packages("pacman") # Check if package manager is installed 
}
# Manage the installation and loading of required packages
pacman::p_load(DiagrammeR, 
               DiagrammeRsvg, 
               rsvg,
               xml2,
               magrittr)

# Create a comprehensive diagram for the Takealot Analytics Hub
graph <- grViz("
digraph takealot_analytics_hub {
  graph [layout = dot, rankdir = TB, fontsize = 10, bgcolor = 'transparent']
  node [shape = box, style = 'filled,rounded', fontname = 'Inter', fontsize = 11, color = '#4A90E2', penwidth = 2]
  edge [color = '#6C7B7F', penwidth = 1.5, arrowsize = 0.8]
  
  // App Initialization Layer
  subgraph cluster_init {
    label = '🚀 Application Initialization'
    style = filled
    fillcolor = '#E8F4FD'
    
    INIT [label = '🎯 Load ML Models\\n(KMeans + XGBoost)\\n+ SHAP Explainer', fillcolor = '#DFF0D8']
    UI [label = '🎨 Glassmorphic UI\\n2025 Design System', fillcolor = '#F0F8FF']
  }
  
  // Main Navigation Tabs
  subgraph cluster_tabs {
    label = '📱 Three-Tab Navigation System'
    style = filled
    fillcolor = '#F8F9FA'
    
    TAB1 [label = '🎯 Customer Analysis\\n(Single Prediction)', fillcolor = '#E3F2FD']
    TAB2 [label = '📊 Dataset Analytics\\n(Batch Processing)', fillcolor = '#FFF3E0']
    TAB3 [label = '📥 Export Hub\\n(Download Center)', fillcolor = '#E8F5E8']
  }
  
  // Customer Analysis Components
  subgraph cluster_analysis {
    label = '🔬 AI-Powered Customer Analysis Engine'
    style = filled
    fillcolor = '#FFF8E1'
    
    INPUT [label = '📝 12 Behavior Inputs\\n(Duration, Rates, Values)', fillcolor = '#FFECB3']
    SEGMENT [label = '🎯 KMeans Clustering\\n(High-Intent vs Casual)', fillcolor = '#F8BBD9']
    PREDICT [label = '🤖 XGBoost Prediction\\n(Purchase Probability)', fillcolor = '#B3E5FC']
    SHAP [label = '🧠 SHAP Analysis\\n(Feature Importance)', fillcolor = '#E1BEE7']
    INSIGHTS [label = '💡 AI Insights\\n(Recommendations)', fillcolor = '#C8E6C9']
  }
  
  // Dataset Processing
  subgraph cluster_dataset {
    label = '📊 Dataset Processing Pipeline'
    style = filled
    fillcolor = '#FAFAFA'
    
    UPLOAD [label = '📂 CSV Upload\\n+ Demo Dataset', fillcolor = '#FFE0B2']
    PREVIEW [label = '👁️ Data Preview\\n(10 rows display)', fillcolor = '#F3E5F5']
    BATCH [label = '⚡ Batch Analysis\\n(Sample Size Control)', fillcolor = '#E0F2F1']
    RESULTS [label = '📈 Batch Results\\n(Summary Statistics)', fillcolor = '#FFF9C4']
  }
  
  // Export System
  subgraph cluster_export {
    label = '💾 Advanced Export System'
    style = filled
    fillcolor = '#F1F8E9'
    
    CSV1 [label = '📊 Single Predictions\\n(.csv download)', fillcolor = '#DCEDC8']
    CSV2 [label = '📈 Batch Results\\n(.csv download)', fillcolor = '#DCEDC8']
    REPORT [label = '📋 Full Report\\n(.txt download)', fillcolor = '#DCEDC8']
  }
  
  // Visualization Components
  subgraph cluster_viz {
    label = '📊 Interactive Visualizations'
    style = filled
    fillcolor = '#FCE4EC'
    
    CARDS [label = '💳 Metric Cards\\n(Segment + Intent)', fillcolor = '#F8BBD9']
    SHAPVIZ [label = '📊 SHAP Plot\\n(Feature Importance)', fillcolor = '#E1BEE7']
    BEHAVIOR [label = '📈 Behavior Metrics\\n(Progress Bars)', fillcolor = '#F3E5F5']
  }
  
  // Main Flow Connections
  INIT -> UI
  UI -> TAB1
  UI -> TAB2
  UI -> TAB3
  
  // Tab 1 Flow
  TAB1 -> INPUT
  INPUT -> SEGMENT
  INPUT -> PREDICT
  PREDICT -> SHAP
  SEGMENT -> CARDS
  PREDICT -> CARDS
  SHAP -> SHAPVIZ
  INPUT -> BEHAVIOR
  SEGMENT -> INSIGHTS
  PREDICT -> INSIGHTS
  
  // Tab 2 Flow
  TAB2 -> UPLOAD
  UPLOAD -> PREVIEW
  UPLOAD -> BATCH
  BATCH -> RESULTS
  
  // Tab 3 Flow
  TAB3 -> CSV1
  TAB3 -> CSV2
  TAB3 -> REPORT
  
  // Data Flow to Export
  SEGMENT -> CSV1 [style=dashed, color='#FF9800']
  PREDICT -> CSV1 [style=dashed, color='#FF9800']
  BATCH -> CSV2 [style=dashed, color='#FF9800']
  RESULTS -> CSV2 [style=dashed, color='#FF9800']
  SHAP -> REPORT [style=dashed, color='#FF9800']
  INSIGHTS -> REPORT [style=dashed, color='#FF9800']
  
  // Caption with updated info
  caption [label = '🛠️ Takealot Customer Analytics Hub - Advanced Python Shiny Dashboard\\nFeatures: ML Models (KMeans + XGBoost), SHAP Analysis, Real-time Predictions, Batch Processing\\nDesigned by M.Nsofu | Built with Python Shiny + Glassmorphic UI',
           shape = plaintext, fontsize = 9, fontcolor = '#455A64', style = 'italic']
  
  // Position caption
  {rank=max; caption}
}
")

# Display the diagram
graph

# Create filename with timestamp
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
base_filename <- paste0("takealot_analytics_hub_", timestamp)

cat("🚀 Generating diagram files...\n")

# Save as SVG
svg_filename <- paste0(base_filename, ".svg")
cat("📄 Creating SVG...\n")
graph %>%
  export_svg() %>%
  writeLines(svg_filename)

# Save as PNG (high resolution)
png_filename <- paste0(base_filename, ".png")
cat("🖼️  Creating PNG...\n")
graph %>%
  export_svg() %>%
  charToRaw() %>%
  rsvg_png(png_filename, width = 1920, height = 1080)

cat("✅ Export completed successfully!\n")

# Print confirmation messages
cat("\n📊 Diagram export completed!\n")
cat(paste(rep("=", 50), collapse = ""), "\n")
cat("📁 Files created:\n")
cat("   📄 SVG:  ", svg_filename, "\n")
cat("   🖼️  PNG:  ", png_filename, " (1920x1080 resolution)\n")
cat("📍 Location: ", getwd(), "\n")
cat(paste(rep("=", 50), collapse = ""), "\n")

# Check file sizes
if (file.exists(svg_filename)) {
  svg_size <- round(file.size(svg_filename) / 1024, 1)
  cat("📏 SVG size: ", svg_size, " KB\n")
}
if (file.exists(png_filename)) {
  png_size <- round(file.size(png_filename) / 1024, 1)
  cat("📏 PNG size: ", png_size, " KB\n")
}

cat("\n🎉 SVG and PNG formats ready for use!\n")



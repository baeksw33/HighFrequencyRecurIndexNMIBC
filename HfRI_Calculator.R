expr <- read.table("your/path/Example_matrix_scaled.txt", header = TRUE, row.names = 1, sep = "\t", check.names = FALSE)

hfri_info <- read.table("your/path/HfRI_Weights.txt", header = TRUE, sep = "\t")

common_genes <- intersect(hfri_info$GeneID, rownames(expr))
expr <- expr[common_genes, ]
hfri_info <- hfri_info[hfri_info$GeneID %in% common_genes, ]
hfri_info <- hfri_info[match(rownames(expr), hfri_info$GeneID), ]  

z_expr <- t(scale(t(expr)))  

weighted_expr <- z_expr * hfri_info$Weights

positive_idx <- hfri_info$Group == "Positive"
negative_idx <- hfri_info$Group == "Negative"

positive_mean <- colMeans(weighted_expr[positive_idx, ])
negative_mean <- colMeans(weighted_expr[negative_idx, ])

HfRI <- positive_mean - negative_mean

output <- rbind(expr, HfRI = HfRI)
write.table(output, file = "your/path/HfRI_score_output.txt", sep = "\t", quote = FALSE, col.names = NA)

# predict_HfRI_score.R

# 1. 데이터 불러오기
# 예시: 예제 유전자 발현 파일 (rows: GeneID, columns: samples)
expr <- read.table("your/path/Example_matrix_scaled.txt", header = TRUE, row.names = 1, sep = "\t", check.names = FALSE)

# 2. HfRI 유전자 정보 불러오기
hfri_info <- read.table("your/path/HfRI_Weights.txt", header = TRUE, sep = "\t")

# 3. 교집합 유전자만 필터링
common_genes <- intersect(hfri_info$GeneID, rownames(expr))
expr <- expr[common_genes, ]
hfri_info <- hfri_info[hfri_info$GeneID %in% common_genes, ]
hfri_info <- hfri_info[match(rownames(expr), hfri_info$GeneID), ]  # 순서 일치

# 4. Z-score 표준화 (gene-wise)
z_expr <- t(scale(t(expr)))  # 각 유전자별 Z-score

# 5. 가중치 곱셈
weighted_expr <- z_expr * hfri_info$Weights

# 6. Positive/Negative 그룹 나눠서 평균 계산
positive_idx <- hfri_info$Group == "Positive"
negative_idx <- hfri_info$Group == "Negative"

positive_mean <- colMeans(weighted_expr[positive_idx, ])
negative_mean <- colMeans(weighted_expr[negative_idx, ])

# 7. HfRI 계산: Positive 평균 - Negative 평균
HfRI <- positive_mean - negative_mean

# 8. 결과 저장 (맨 아래 HfRI 추가)
output <- rbind(expr, HfRI = HfRI)
write.table(output, file = "your/path/HfRI_score_output.txt", sep = "\t", quote = FALSE, col.names = NA)

library("data.table")

dt <- wrapr::build_frame(
  "Bacteria"                    , "Penicillin", "Streptomycin", "Neomycin", "Gram_stain" |
    "Aerobacter aerogenes"      , 870         , 1             , 1.6       , "negative"   |
    "Bacillus anthracis"        , 0.001       , 0.01          , 0.007     , "positive"   |
    "Brucella abortus"          , 1           , 2             , 0.02      , "negative"   |
    "Streptococcus pneumoniae"  , 0.0005      , 11            , 10        , "positive"   |
    "Escherichia coli"          , 100         , 0.4           , 0.1       , "negative"   |
    "Klebsiella pneumoniae"     , 850         , 1.2           , 1         , "negative"   |
    "Mycobacterium tuberculosis", 800         , 5             , 2         , "negative"   |
    "Proteus vulgaris"          , 3           , 0.1           , 0.1       , "negative"   |
    "Pseudomonas aeruginosa"    , 850         , 2             , 0.4       , "negative"   |
    "Salmonella (Eberthella) typhosa", 1      , 0.4           , 0.008     , "negative"   |
    "Salmonella schottmuelleri" , 10          , 0.8           , 0.09      , "negative"   |
    "Staphylococcus albus"      , 0.007       , 0.1           , 0.001     , "positive"   |
    "Staphylococcus aureus"     , 0.03        , 0.03          , 0.001     , "positive"   |
    "Enterococcus faecalis"     , 1           , 1             , 0.1       , "positive"   |
    "Streptococcus hemolyticus" , 0.001       , 14            , 10        , "positive"   |
    "Streptococcus viridans"    , 0.005       , 10            , 40        , "positive"   )
dt <- data.table(dt)
setcolorder(dt, c("Bacteria", "Gram_stain", "Penicillin", "Streptomycin", "Neomycin"))

# # Log10 of MIC
# dt[, Penicillin   := round(log10(Penicillin),   2)]
# dt[, Streptomycin := round(log10(Streptomycin), 2)]
# dt[, Neomycin     := round(log10(Neomycin),     2)]
# 
# # Obtain median MIC by bacteria
# dt[, Row_median := apply(.SD, 1, median), .SDcols = c("Penicillin", "Streptomycin", "Neomycin")]
# dt <- dt[order(Row_median)]
# dt[, Row_median := NULL]

# fwrite(x = dt, file = "data/antibiotic-bacteria-log10-mic.csv")
fwrite(x = dt, file = "data/antibiotic-bacteria-mic.csv")

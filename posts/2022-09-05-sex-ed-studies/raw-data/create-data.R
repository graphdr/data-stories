library("data.table")

dt <- wrapr::build_frame(
  "study", "Topic", "Sex", "start", "end", "pct" |
    1, "Say no to sex", "Female",  1995,  1995, 92 |
    2, "Say no to sex", "Female",  2002,  2002, 86 |
    3, "Say no to sex", "Female",  2006,  2010, 89 |
    4, "Say no to sex", "Female",  2011,  2015, 84 |
    5, "Say no to sex", "Female",  2015,  2019, 81 |
    
    1, "Say no to sex", "Male",    1995,  1995, 74 |
    2, "Say no to sex", "Male",    2002,  2002, 83 |
    3, "Say no to sex", "Male",    2006,  2010, 82 |
    4, "Say no to sex", "Male",    2011,  2015, 82 |
    5, "Say no to sex", "Male",    2015,  2019, 80 |
    
    1, "Birth control", "Female",  1995,  1995, 87 |
    2, "Birth control", "Female",  2002,  2002, 70 |
    3, "Birth control", "Female",  2006,  2010, 70 |
    4, "Birth control", "Female",  2011,  2015, 66 |
    5, "Birth control", "Female",  2015,  2019, 64 |
    
    1, "Birth control", "Male",    1995,  1995, 81 |
    2, "Birth control", "Male",    2002,  2002, 66 |
    3, "Birth control", "Male",    2006,  2010, 61 |
    4, "Birth control", "Male",    2011,  2015, 58 |
    5, "Birth control", "Male",    2015,  2019, 63
)
setDT(dt)
setorder(dt, study, Topic, Sex)
setcolorder(dt, c("study", "start", "end", "Topic", "Sex", "pct"))
dt[, pct := as.double(pct)]
fwrite(dt, "data/sex-ed-topics-data.csv")

# Statistics and data mining with PDL

Maggie Xiong

Get used to variability

Know your data

Descriptive distribution akak histogram
e.g. history gram of length of words in search queries
PDL::Stats::Distr

Central tendency: Mean, median mode

Spread: Range and variance (sum of squared deviations)

Standard deviation is sqrt(variance).

# Inferential statistics

How do we know if the idfference is between two samples from the
same population or between two populations?

    pdl(4,2,8,4)->avg; # 4.5
    pdl(4,8,6,6)->avg; # 6

# Hypothesis testing

The null hypothesis

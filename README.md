# 2019nCoV

Update: Feb-03-2019 | added England, Finland, Singapore, Zhejiang and Genbank genomes\
old Update: Jan-31-2019 | added Australian and German genome\
Jan-30-2019\
@sungml92 // sl74@rice.edu\
\
Preliminary Phylogenetic and evolutionary analysis of 2019 nCoV genomes.\
\
Phylogenetic analysis with publicy shared 2019nCoV genomes from GISAID epiflu database. As of Jan-31-2019, there are 61 betaCov 2019-2020 submissions on GISAID.

### Phylogenetic analysis
Of 61 submissions, 60 are betaCov 2019-2020 genome and one genome is suspected common ancestor for the novel coronavirus. We reports preliminary findings for 51 betaCov 2019-2020 genome (removed, 3: partial genome, 2: missing accurate isolation date, 4: substantial sequencing error) + including NCBI genomes (or EPI_ISL_406716 and EPI_ISL_406717 in EpiFlu).

Maximum likelihood (ML) phylogenetic tree was estimated wih RaxML v8.2.8 \[1\] and Maximum Clade Credibility (MCC) tree was estimated with BEAST v1.10.4 \[2\]. Both trees are visualized with ggtree package in R. A Wuhan sequence isolated on 12/24/2019 was used as an outgroup in ML tree for tree visualization.


ML tree            |  root-to-tip
:-------------------------:|:-------------------------:
<img src="tree/2019-nCoV_020320_tempest.png" width = 300>  |  <img src="tree/2019-nCov_020320_root_to_tip.png" width = 300>

###### MCC tree
<img src="tree/2019-nCov_013120_hkyr4_cons.png" width = 300>



### Divergence timing

BEASTv.1.10.4 software was used to calculate a estimated date of the most recent common ancestor. We considered 1) constant size coalescent model and 2) exponential growth coalescent model.

|   | tMRCA \[95% HPD\] |
| ------------- | ------------- |
| Constant Size Coalescent Model  | 2019.602 \[2019.279-2019.848\]  |
| Exponential Growth Coalescent Model  | 2019.599 \[2019.257-2019.838\]  |

median and 95% HPD of tMRCA estimation is earlier than other reports, possibly due to inclusion of EPI_ISL_406592 genome. It is uncertain whether the genome has sequencing errors.\
\
Removing EPI_ISL_406592 yields tMRCA of 2019.883 \[2019.773-2019.961\] with constant size model and tMRCA of 2019.877 \[2019.754-2019.962\] with exponential growth model.

### Sequence variation
(add sequence variation)

### Evolutionary analysis

MEME \[3\] was run to identify any sites under episodic positive selection within sample population. No signals, but signals in orf1ab, orf3a, S, and orf7a, and N after adding outgroup Yunnan bat virus.

The evolutionary rate of the virus from 48 full genomes.

|   | mean rate year<sup>-1</sup> nucleotide<sup>-1</sup> \[95% HPD\] |
| ------------- | ------------- |
| Constant Size Coalescent Model  | 1.35E<sup>-3</sup> \[0.606E<sup>-3</sup> - 2.2E<sup>-3</sup>\]  |
| Exponential Growth Coalescent Model  | 1.33E<sup>-3</sup> \[0.54E<sup>-3</sup> - 2.13E<sup>-3</sup>\]  |

Removing EPI_ISL_406592 yields evolutionary rate of 1.56E<sup>-3</sup> \[0.747E<sup>-3</sup> - 2.49E<sup>-3</sup>\] with constant size model and 1.51E<sup>-3</sup> \[0.616E<sup>-3</sup> - 2.44E<sup>-3</sup>\] with exponential growth model.\
Interestingly, evolutionary rate increases upon removal of possile outlier.\
\
Estimated mutation rate of 11 SARS genomes was 0.80–2.38 per site per year \[4; calculated by Method 1\].

### Note

As pointed out by \[5\], tMRCA and mean rate is an estimate for sampled population that only span about an year. Especially for tMRCA, only its range can be used as a guide to estimate common sampled ancestor. 

Substantial sequencing error caused the distance EPI_ISL_406592. See discussion on Virological, https://bit.ly/386ZLuI.

### Sampling location of 48 nCoV genomes

| Location | Count |
| ------------- | ------------- |
| Wuhan  | 18  |
| Guanggdong  | 8 |
| Shenzhen  | 4  |
| Foshan  | 3 |
| Zhejiang  | 2  |
| California  | 2 |
| France  | 2  |
| Nonthanburi  | 2 |
| Arizona  | 1  |
| Guangzhou  | 1 |
| Illinois  | 1  |
| Taiwan  | 1 |
| Washington  | 1 |
| Germany  | 1 |
| Australia  | 1 |
| Total | 48 |

### Reference
1. Stamatakis, A. (2014). RAxML version 8: A tool for phylogenetic analysis and post-analysis of large phylogenies. Bioinformatics (Oxford, England), 30(9), 1312–1313. https://doi.org/10.1093/bioinformatics/btu033
\
2. Suchard, M. A., Lemey, P., Baele, G., Ayres, D. L., Drummond, A. J., & Rambaut, A. (2018). Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution, 4(1). https://doi.org/10.1093/ve/vey016
\
3. Murrell, B., Wertheim, J. O., Moola, S., Weighill, T., Scheffler, K., & Pond, S. L. K. (2012). Detecting Individual Sites Subject to Episodic Diversifying Selection. PLOS Genetics, 8(7), e1002764. https://doi.org/10.1371/journal.pgen.1002764
\
4. Zhao, Z., Li, H., Wu, X., Zhong, Y., Zhang, K., Zhang, Y.-P., Boerwinkle, E., & Fu, Y.-X. (2004). Moderate mutation rate in the SARS coronavirus genome and its implications. BMC Evolutionary Biology, 4(1), 21. https://doi.org/10.1186/1471-2148-4-21
\
5. http://virological.org/t/phylodynamic-analysis-of-ncov-2019-genomes-29-jan-2020/353 

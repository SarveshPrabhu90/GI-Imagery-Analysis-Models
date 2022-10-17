# GI-Imagery-Analysis-Models

## Kvasir
A Multi-Class Image-Dataset for Computer Aided Gastrointestinal Disease Detection

## HyperKvasir Dataset 	
Data is collected from various patients of Bærum Hospital, Norway
Partly labeled by experienced gastroenterologists 
Reviewed with the practitioners at Alpharetta for further refinement
1m total images (336 x 336 pixels),  374 videos at 6fps
4.74m images are also available but not used in the research 

## Governance & Permissible use 	
The hospital’s IT fully anonymized the data
Compliant with the Norwegian Privacy Data Protection Authority & GDPR
Hospital assured proper distribution of samples and bias removal 
Data is not pre-processed or augmented
Data collection did not interfere with the care of the patient


## Image Labels
Hyper-Kvasir includes the follow image labels for the labeled part of the dataset:

| ID | Label | ID | Label
| --- | --- | --- | --- |
| 0  | barretts | 12 |  oesophagitis-b-d
| 1  | bbps-0-1 | 13 |  polyp
| 2  | bbps-2-3 | 14 |  retroflex-rectum
| 3  | dyed-lifted-polyps | 15 |  retroflex-stomach
| 4  | dyed-resection-margins | 16 |  short-segment-barretts
| 5  | hemorrhoids | 17 |  ulcerative-colitis-0-1
| 6  | ileum | 18 |  ulcerative-colitis-1-2
| 7  | impacted-stool | 19 |  ulcerative-colitis-2-3
| 8  | normal-cecum | 20 |  ulcerative-colitis-grade-1
| 9  | normal-pylorus | 21 |  ulcerative-colitis-grade-2
| 10 | normal-z-line | 22 |  ulcerative-colitis-grade-3
| 11 | oesophagitis-a |  |  |

## Cite
If you use this dataset in your research, Please cite the following paper:

    @article{Borgli2020,
      author = {
        Borgli, Hanna and Thambawita, Vajira and
        Smedsrud, Pia H and Hicks, Steven and Jha, Debesh and
        Eskeland, Sigrun L and Randel, Kristin Ranheim and
        Pogorelov, Konstantin and Lux, Mathias and
        Nguyen, Duc Tien Dang and Johansen, Dag and
        Griwodz, Carsten and Stensland, H{\aa}kon K and
        Garcia-Ceja, Enrique and Schmidt, Peter T and
        Hammer, Hugo L and Riegler, Michael A and
        Halvorsen, P{\aa}l and de Lange, Thomas
      },
      doi = {10.1038/s41597-020-00622-y},
      issn = {2052-4463},
      journal = {Scientific Data},
      number = {1},
      pages = {283},
      title = {{HyperKvasir, a comprehensive multi-class image and video dataset for gastrointestinal endoscopy}},
      url = {https://doi.org/10.1038/s41597-020-00622-y},
      volume = {7},
      year = {2020}
    }


## Terms of Use
The data is released fully open for research and educational purposes. The use of the dataset for purposes such as competitions and commercial purposes needs prior written permission. In all documents and papers that use or refer to the dataset or report experimental results based on the Hyper-Kvasir, a reference to the related article needs to be added: https://www.nature.com/articles/s41597-020-00622-y.

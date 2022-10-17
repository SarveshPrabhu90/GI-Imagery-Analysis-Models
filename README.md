# Parva Capsula: GI Medical Imagery Analysis

Imagine a patient admitted to the emergency at 1 am with a detrimental stomachache. 

It takes several hours of diagnosis before the patient gets to see a GI doctor in the operating room, and the last thing the patient wants is to stick a probe with a camera from the rear when he is already in chronic pain.

The actual treatment begins after the GI doc diagnoses the problem. According to American Gastroenterology Association, it takes up to 14 hours for the GI doc to share the diagnosis. Meanwhile, in most cases, all the patient receives only pain medication. 

For the patient, this is elongated pain.
The GI doc had to wake up in the middle of the night to commute to the hospital for an emergency colonoscopy.
For the insurance carrier, it costs money the longer the patient stays in the hospital.
For the hospital, it’s prime real estate. 
 
**My solution is Parva, a swallowable smart pill**. The pill contains a camera and communicates to a smartphone via Bluetooth. The patient takes it as soon as they walk into the emergency. 

The pill takes pictures and videos at 6fps as it travels through the upper and lower GI tract and communicates with the smartphone as it travels through the body. 
 
The pictures are then analyzed for areas of interest, what I call biomarkers. The research empowers practitioners to reach a faster conclusion for patient treatment, by several hours in advance, compared to a traditional colonoscopy, all while being non-invasive; from an emergency, surgical perspective.

Parva is a ground 0 solution, and has implementations even from today in the form of screenings.

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

## Parva Research Conclusion - The Verdict 
The research concludes that ensembling the GNN and multi-layered Random Forest yields the highest accuracy and consistent results.

The ensembling yields 99.8% precision and 100% recall, enabling the practitioner to make an informed treatment decision using a non-invasive smart pill for the patient in need of urgent care. 

I sincerely thank my mentor Mr. Bob Foreman, Mr. Roger Dev, and my manager Ms. Lorraine Chapman for being such fantastic help through my HPCC journey. Without them, I would not have had the opportunity to give back to the practitioners and hospitals saving tomorrow’s lives today. Thank you! 

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

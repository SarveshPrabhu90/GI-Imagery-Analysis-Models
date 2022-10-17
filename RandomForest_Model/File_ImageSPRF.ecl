IMPORT STD;
EXPORT File_ImageSPRF := MODULE
 EXPORT imageRecord := RECORD
  STRING filename;
  DATA   image;   
//first 4 bytes contain the length of the image data
  UNSIGNED8  RecPos{virtual(fileposition)};
 END;
 EXPORT ampulla := DATASET('~sarvesh::train::ampulla',imageRecord,FLAT);
 EXPORT angiectasia := DATASET('~sarvesh::train::angiectasia',imageRecord,FLAT);
 EXPORT erosion := DATASET('~sarvesh::train::erosion',imageRecord,FLAT);
 EXPORT lymphan := DATASET('~sarvesh::image::lymphan',imageRecord,FLAT);
 EXPORT polyp := DATASET('~sarvesh::image::polyp',imageRecord,FLAT);
 EXPORT erythema := DATASET('~sarvesh::train::erythema',imageRecord,FLAT);
  //Add RecID and Dependent Data
 EXPORT imageRecordPlus := RECORD
   UNSIGNED1 RecID; 
   UNSIGNED1 YType;
   imageRecord;
 END;
 
  // EXPORT imageDataPlus := PROJECT(imageData, 
                                  // TRANSFORM(imageRecordPlus,
                                            // SELF.RecID := COUNTER,
                                            // SELF.YType := IF(STD.STR.Find(LEFT.filename,'dog')<> 0,1,0),;
																		   // SELF.Image := LEFT.IMAGE[51..],
																		   // SELF := LEFT)); 
                  
                          
    EXPORT imageDataPlus := PROJECT(ampulla+angiectasia+erosion+lymphan+polyp+erythema, 
                                  TRANSFORM(imageRecordPlus,
                                            SELF.RecID := COUNTER,
                                            SELF.YType := MAP(LEFT.filename[..4] = '2fc3' => 1,
                                                              LEFT.filename[..4] = '1313' => 1,
                                                              LEFT.filename[..4] = 'eb02' => 1,
                                                              LEFT.filename[..4] = '04a7' => 1,
                                                              LEFT.filename[..4] = 'd369' => 1,
                                                              LEFT.filename[..4] = '8ebf' => 1,
                                                              LEFT.filename[..4] = '5e59' => 1,
                                                              LEFT.filename[..4] = '3ad9' => 1,
                                                              LEFT.filename[..4] = 'd626' => 1,
                                                              0);
																		     SELF.Image := LEFT.IMAGE[639..],
																		     SELF := LEFT));                                       
																																		 
END;
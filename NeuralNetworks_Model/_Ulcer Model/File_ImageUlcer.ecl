IMPORT STD;
EXPORT File_ImageUlcer := MODULE
 EXPORT imageRecord := RECORD
  STRING filename;
  DATA   image;   
//first 4 bytes contain the length of the image data
  UNSIGNED8  RecPos{virtual(fileposition)};
 END;
 EXPORT imageData := DATASET('~sarvesh::image::ulcer',imageRecord,FLAT);
 //Add RecID and Dependent Data
 EXPORT imageRecordPlus := RECORD
   UNSIGNED1 RecID; 
   UNSIGNED1 YType;
   imageRecord;
 END;
 
  EXPORT imageDataPlus := PROJECT(imageData, 
	                                 TRANSFORM(imageRecordPlus,
	                                           SELF.RecID := COUNTER,
																									           SELF.YType := IF(STD.STR.Find(LEFT.filename,'cancer')<> 0,1,0),;
																															   SELF.Image := LEFT.IMAGE[51..],
																																  SELF := LEFT)); 
																																		 
END;


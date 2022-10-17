IMPORT $;
Images := $.File_Images.MLImagesDS;


EXPORT Prep01 := MODULE
MLImgExt := RECORD(Images)
  UNSIGNED4 rnd;
  
END;
IMPORT STD;

/* Spray a CSV file from the landing zone to Thor */

file_scope := '~Sarvesh';
project_scope := 'MedFiles';
in_files_scope := 'in';
out_files_scope := 'out';

file_csv := file_scope + '::' + project_scope + '::' + in_files_scope + '::Sarvesh_Densenet161_split_0_inference_CSV';

/* Record Set for medical images - Densenet161_split_0 and 1 */ 
covTypeRec := RECORD
    UNSIGNED8 id;
    STRING128 ImageId;
    REAL Label;
    REAL A;
    REAL B;
    REAL C;
    REAL D;
    REAL E;
    REAL F;
    REAL G;
    REAL H;
    REAL I;
    REAL J;
    REAL K;
    REAL L;
    REAL M;
    REAL N;
    REAL O;
    REAL P;
    REAL Q;
    REAL R;
    REAL S;
    REAL T;
    REAL U;
    REAL V;
    REAL W;
    REAL covType;
END;

//Read the contents of the file 
trainRecs_All := DATASET(file_csv, covTypeRec, CSV(HEADING(1)));

// Prepare Training dataset 
//trainDat := trainRecs_All(id <= 1000);

// Prepare Test dataset 
//testDat := trainRecs_All(ID > 1000, ID <= 2500);
//OUTPUT(testDat, NAMED('testDat'));

file_name := file_scope + '::' + project_scope + '::' + in_files_scope + '::Sarvesh_Densenet161_split_0_inference';

OUTPUT(trainRecs_All,,file_name, OVERWRITE, THOR); 

trainRecs_All1 := DATASET(file_scope + '::' + project_scope + '::' + in_files_scope + '::Sarvesh_Densenet161_split_1_inference_CSV', covTypeRec, CSV(HEADING(1)));

OUTPUT(trainRecs_All1,,file_scope + '::' + project_scope + '::' + in_files_scope + '::Sarvesh_Densenet161_split_1_inference', OVERWRITE, THOR); 
       
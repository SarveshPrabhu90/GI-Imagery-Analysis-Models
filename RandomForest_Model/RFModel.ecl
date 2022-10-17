
IMPORT $.^ AS LT;
IMPORT STD;
IMPORT File_ImageSPRF;
IMPORT ML_Core.Types AS CTypes;
IMPORT LTTypes AS Types;

NumericField := CTypes.NumericField;
DiscreteField := CTypes.DiscreteField;
errorProb := 0;
wiCount := 1;
numTrainingRecs := 1000;
numTestRecs := 1000;
numTrees := 24;
numVarsPerTree := 2;

imagerecord := $.File_ImageSPRF.imageRecordPlus;
plusrecs    := $.File_ImageSPRF.ImageDataPlus;
FuncLayerDef := Types.FuncLayerDef;

// Return TRUE with probability p
prob(REAL p) := FUNCTION
  rnd := RANDOM() % 1000000 + 1;
  isTrue := IF(rnd / 1000000 <= p, TRUE, FALSE);
  RETURN isTrue;
END;


ds := NORMALIZE(dummy, numTrainingRecs, make_data(LEFT, COUNTER));
OUTPUT(ds, NAMED('TrainingData')); 

X1 := PROJECT(ds, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 1,
                            SELF.value := LEFT.X1));
X2 := PROJECT(ds, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 2,
                            SELF.value := LEFT.X2));
X3 := PROJECT(ds, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 3,
                            SELF.value := LEFT.X3));
// Add noise to Y by randomly flipping the value according to PROBABILITY(errorProb).
Y := PROJECT(ds, TRANSFORM(DiscreteField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 1,
                            SELF.value := IF(prob(errorProb), (LEFT.Y + 1)%2, LEFT.Y)));
nominals := [];
X := X1 + X2 + X3;

// Expand to number of work items
Xe := NORMALIZE(X, wiCount, TRANSFORM(NumericField, SELF.wi := COUNTER, SELF := LEFT));
Ye := NORMALIZE(Y, wiCount, TRANSFORM(DiscreteField, SELF.wi := COUNTER, SELF := LEFT));

OUTPUT(Ye, NAMED('Y_train'));

F := LT.ClassificationForest(numTrees, numVarsPerTree);

mod := F.GetModel(Xe, Ye);

// With this line it runs fine.
//mod := F.GetModel(X, Y, nominals);

OUTPUT(mod, NAMED('Model'));
modStats := F.GetModelStats(mod);
OUTPUT(modStats, NAMED('ModelStats'));
tn0 := F.Model2Nodes(mod);
tn := SORT(tn0, wi, treeId, level, nodeid, id, number, depend);
OUTPUT(tn, {wi, level, treeId, nodeId, parentId, isLeft, id, number, value, depend, support, isOrdinal},NAMED('Tree'));

dsTest := DISTRIBUTE(SORT(NORMALIZE(dummy, numTestRecs, make_data(LEFT, COUNTER)), id, LOCAL), id);
X1t := PROJECT(dsTest, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 1,
                            SELF.value := LEFT.X1));
X2t := PROJECT(dsTest, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 2,
                            SELF.value := LEFT.X2));
X3t := PROJECT(dsTest, TRANSFORM(NumericField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 3,
                            SELF.value := LEFT.X3));
Xt := X1t + X2t + X3t;
Ycmp := PROJECT(dsTest, TRANSFORM(DiscreteField, SELF.wi := 1, SELF.id := LEFT.id, SELF.number := 1,
                            SELF.value := LEFT.Y));
Yhat0 := F.Classify(mod, Xt);
Yhat := DISTRIBUTE(SORT(Yhat0, id, LOCAL),  id);
OUTPUT(Yhat, NAMED('rawPredict'));

accuracy := F.Accuracy(mod, Ycmp, Xt);
OUTPUT(accuracy, NAMED('Accuracy'));

precision := F.Precision(mod, Ycmp, Xt);
OUTPUT(precision, NAMED('Precision'));

recall := F.Recall(mod, Ycmp, Xt);
OUTPUT(recall, NAMED('Recall'));
;

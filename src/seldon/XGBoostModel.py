#!/usr/bin/env python
import os
import logging

import xgboost as xgb
import mlflow.xgboost

logger = logging.getLogger(__name__)

from base import Base

class XGBoostModel(Base):
    """
    Model template. You can load your model parameters in __init__ from a location accessible at runtime
    """

    def __init__(self):
        """
        Add any initialization parameters. These will be passed at runtime from the graph definition parameters defined in your seldondeployment kubernetes resource manifest.
        """        
        super().__init__('XGBoost')

        #model_path = '/tmp/model'
        model_path = os.environ['HOME'] + '/model'
        self.model = mlflow.xgboost.load_model(model_path)
        
        (model_path)
        
    def predict(self, X, features_names):
        """
        Return a prediction.

        Parameters
        ----------
        X : array-like
        feature_names : array of feature names (optional)
        """
        self.requests += 1

        dmatrix = xgb.DMatrix(X)
        return self.model.predict(dmatrix)
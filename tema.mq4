//+------------------------------------------------------------------+
//|                                                         tema.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+


// Define your input parameters
input int EMA_Period1 = 50; // First EMA period
input int EMA_Period2 = 20; // Second EMA period
input int EMA_Period3 = 8;  // Third EMA period

// Function to calculate individual EMAs
void CalculateEMAs(double &EMA1, double &EMA2, double &EMA3, int shift) {
    string symbol = Symbol(); // Retrieve the current symbol
    int timeframe = Period(); // Retrieve the current timeframe
    
    EMA1 = iMA(symbol, timeframe, EMA_Period1, 0, MODE_EMA, PRICE_CLOSE, shift);
    EMA2 = iMA(symbol, timeframe, EMA_Period2, 0, MODE_EMA, PRICE_CLOSE, shift);
    EMA3 = iMA(symbol, timeframe, EMA_Period3, 0, MODE_EMA, PRICE_CLOSE, shift);
}


int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  // Variables to store EMA values
    double firstEMA, secondEMA, thirdEMA;
    
    // Calculate the EMA values
    CalculateEMAs(firstEMA, secondEMA, thirdEMA, 0);
    
    // Example Print Statements
    Print("The EMAs for symbol ", Symbol(), " are EMA1: ", firstEMA, ", EMA2: ", secondEMA, ", EMA3: ", thirdEMA);

   
  }
//+------------------------------------------------------------------+

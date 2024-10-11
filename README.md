# Implicit Bias Psychometric Evaluation
## Description

All of our testing results are in `\result\`, testing scripts are in `\scripts\`. 

## Run evaluations

1. Install the required packages by running `pip install -r requirements.txt`.
2. `cd scripts/<MODEL>` to cd into some directory.
3. Fill in the `config.py` file in the directory, including API key and url.
4. Run the following command to evaluate the implicit bias of a model:
```
# discriminative tasks
sh run_discriminative.sh
```

## Run anlytical experiments
After running the evaluations, you can run the following command to get the results:
```
cd scripts/gpt-3.5-turbo-1106
sh analytical_experiments.sh
```

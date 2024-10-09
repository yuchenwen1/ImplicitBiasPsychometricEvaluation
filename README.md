# Evaluating Implicit Bias in LLMs by Attacking From a Psychometric Perspective

## Run evaluations
1. Install the required packages by running `pip install -r requirements.txt`.
2. `cd scripts/<MODEL>` into some directory.
3. Fill in the `config.py` file in the directory, including the API key and URL.
4. Run the following command to evaluate the implicit bias of a model:
```
# discriminative tasks
sh run_discriminative.sh

# generative tasks
sh run_generative.sh
```

## Run analytical experiments
After running the evaluations, you can run the following command to get the results:
```
cd scripts/gpt-3.5-turbo-1106
sh analytical_experiments.sh
```

# Evaluating Implicit Bias in LLMs by Attacking From a Psychometric Perspective
This repository contains the code and data for the paper "[Evaluating Implicit Bias in Large Language Models by Attacking From a Psychometric Perspective](https://arxiv.org/abs/2406.14023)" by [Yuchen Wen](https://wen112358.github.io/), [Keping Bi](https://kepingbi.github.io/), [Wei Chen](https://weichen-cas.github.io/), [Jiafeng Guo](http://www.bigdatalab.ac.cn/gjf/) and [Xueqi Cheng](https://people.ucas.ac.cn/~cxq?language=en).

## Run evaluations
1. Install the required packages by running `pip install -r requirements.txt`.
2. `cd scripts/<MODEL>` to cd into some directory.
3. Fill in the `config.py` file in the directory, including API key and url.
4. Run the following command to evaluate the implicit bias of a model:
```
# discriminative tasks
sh run_discriminative.sh

# generative tasks
sh run_generative.sh
```

## Run anlytical experiments
After running the evaluations, you can run the following command to get the results:
```
cd scripts/gpt-3.5-turbo-1106
sh analytical_experiments.sh
```

## Citation
If you find our work helpful, please star this repository and cite the following paper:
```
@article{wen2024evaluating,
  title={Evaluating Implicit Bias in Large Language Models by Attacking From a Psychometric Perspective},
  author={Wen, Yuchen and Bi, Keping and Chen, Wei and Guo, Jiafeng and Cheng, Xueqi},
  journal={arXiv preprint arXiv:2406.14023},
  year={2024}
}
```

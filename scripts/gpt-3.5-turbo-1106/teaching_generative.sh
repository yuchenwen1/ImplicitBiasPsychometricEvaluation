cd ./teaching_generative

python fewshot_proper.py -c age -l zh
python fewshot_proper.py -c gender -l zh
python fewshot_proper.py -c race -l zh
python fewshot_proper.py -c sexual_orientation -l zh
python fewshot_proper.py -c age -l en
python fewshot_proper.py -c gender -l en
python fewshot_proper.py -c race -l en
python fewshot_proper.py -c sexual_orientation -l en


python evaluate_writing.py -c age -l zh -m fewshot_proper
python evaluate_writing.py -c gender -l zh -m fewshot_proper
python evaluate_writing.py -c race -l zh -m fewshot_proper
python evaluate_writing.py -c sexual_orientation -l zh -m fewshot_proper
python evaluate_writing.py -c age -l en -m fewshot_proper
python evaluate_writing.py -c gender -l en -m fewshot_proper
python evaluate_writing.py -c race -l en -m fewshot_proper
python evaluate_writing.py -c sexual_orientation -l en -m fewshot_proper

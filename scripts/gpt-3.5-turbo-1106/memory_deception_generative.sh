cd ./memory_deception_generative

python multiround.py -c age -l zh -t ambiguous_none
python multiround.py -c gender -l zh -t ambiguous_none
python multiround.py -c race -l zh -t ambiguous_none
python multiround.py -c sexual_orientation -l zh -t ambiguous_none
python multiround.py -c age -l en -t ambiguous_none
python multiround.py -c gender -l en -t ambiguous_none
python multiround.py -c race -l en -t ambiguous_none
python multiround.py -c sexual_orientation -l en -t ambiguous_none

python evaluate_writing.py -c age -l zh -m multiround_ambiguous_none
python evaluate_writing.py -c gender -l zh -m multiround_ambiguous_none
python evaluate_writing.py -c race -l zh -m multiround_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l zh -m multiround_ambiguous_none
python evaluate_writing.py -c age -l en -m multiround_ambiguous_none
python evaluate_writing.py -c gender -l en -m multiround_ambiguous_none
python evaluate_writing.py -c race -l en -m multiround_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l en -m multiround_ambiguous_none
cd ./mental_generative

python general_mind.py -c age -l zh -t ambiguous_none
python general_mind.py -c gender -l zh -t ambiguous_none
python general_mind.py -c race -l zh -t ambiguous_none
python general_mind.py -c sexual_orientation -l zh -t ambiguous_none
python general_mind.py -c age -l en -t ambiguous_none
python general_mind.py -c gender -l en -t ambiguous_none
python general_mind.py -c race -l en -t ambiguous_none
python general_mind.py -c sexual_orientation -l en -t ambiguous_none
python evaluate_writing.py -c age -l zh -m general_mind_ambiguous_none
python evaluate_writing.py -c gender -l zh -m general_mind_ambiguous_none
python evaluate_writing.py -c race -l zh -m general_mind_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l zh -m general_mind_ambiguous_none
python evaluate_writing.py -c age -l en -m general_mind_ambiguous_none
python evaluate_writing.py -c gender -l en -m general_mind_ambiguous_none
python evaluate_writing.py -c race -l en -m general_mind_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l en -m general_mind_ambiguous_none
echo general_mind
cd ./disguise_generative

python conversation.py -c age -l zh -t ambiguous_none
python conversation.py -c gender -l zh -t ambiguous_none
python conversation.py -c race -l zh -t ambiguous_none
python conversation.py -c sexual_orientation -l zh -t ambiguous_none
python conversation.py -c age -l en -t ambiguous_none
python conversation.py -c gender -l en -t ambiguous_none
python conversation.py -c race -l en -t ambiguous_none
python conversation.py -c sexual_orientation -l en -t ambiguous_none
python evaluate_writing.py -c age -l zh -m conversation_ambiguous_none
python evaluate_writing.py -c gender -l zh -m conversation_ambiguous_none
python evaluate_writing.py -c race -l zh -m conversation_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l zh -m conversation_ambiguous_none
python evaluate_writing.py -c age -l en -m conversation_ambiguous_none
python evaluate_writing.py -c gender -l en -m conversation_ambiguous_none
python evaluate_writing.py -c race -l en -m conversation_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l en -m conversation_ambiguous_none
echo conversation

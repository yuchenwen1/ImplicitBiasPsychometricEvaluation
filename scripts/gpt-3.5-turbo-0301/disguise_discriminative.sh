cd ./disguise_discriminative

python conversation.py -c age -l zh -t ambiguous_none
python conversation.py -c gender -l zh -t ambiguous_none
python conversation.py -c race -l zh -t ambiguous_none
python conversation.py -c sexual_orientation -l zh -t ambiguous_none
python conversation.py -c age -l en -t ambiguous_none
python conversation.py -c gender -l en -t ambiguous_none
python conversation.py -c race -l en -t ambiguous_none
python conversation.py -c sexual_orientation -l en -t ambiguous_none
echo conversation

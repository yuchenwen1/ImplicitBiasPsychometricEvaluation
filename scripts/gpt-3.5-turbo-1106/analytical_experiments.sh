cd ./baselines_discriminative

python basic_conversationlast.py -c age -l zh
python basic_conversationlast.py -c gender -l zh
python basic_conversationlast.py -c race -l zh
python basic_conversationlast.py -c sexual_orientation -l zh
python basic_conversationlast.py -c age -l en
python basic_conversationlast.py -c gender -l en
python basic_conversationlast.py -c race -l en
python basic_conversationlast.py -c sexual_orientation -l en

python context+conversationlast.py -c age -l zh -t ambiguous_none
python context+conversationlast.py -c gender -l zh -t ambiguous_none
python context+conversationlast.py -c race -l zh -t ambiguous_none
python context+conversationlast.py -c sexual_orientation -l zh -t ambiguous_none
python context+conversationlast.py -c age -l en -t ambiguous_none
python context+conversationlast.py -c gender -l en -t ambiguous_none
python context+conversationlast.py -c race -l en -t ambiguous_none
python context+conversationlast.py -c sexual_orientation -l en -t ambiguous_none

cd ../disguise_discriminative

python conversation_followroleplay.py -c age -l zh -t ambiguous_none
python conversation_followroleplay.py -c gender -l zh -t ambiguous_none
python conversation_followroleplay.py -c race -l zh -t ambiguous_none
python conversation_followroleplay.py -c sexual_orientation -l zh -t ambiguous_none
python conversation_followroleplay.py -c age -l en -t ambiguous_none
python conversation_followroleplay.py -c gender -l en -t ambiguous_none
python conversation_followroleplay.py -c race -l en -t ambiguous_none
python conversation_followroleplay.py -c sexual_orientation -l en -t ambiguous_none

python conversation_oppositeroleplay.py -c age -l zh -t ambiguous_none
python conversation_oppositeroleplay.py -c gender -l zh -t ambiguous_none
python conversation_oppositeroleplay.py -c race -l zh -t ambiguous_none
python conversation_oppositeroleplay.py -c sexual_orientation -l zh -t ambiguous_none
python conversation_oppositeroleplay.py -c age -l en -t ambiguous_none
python conversation_oppositeroleplay.py -c gender -l en -t ambiguous_none
python conversation_oppositeroleplay.py -c race -l en -t ambiguous_none
python conversation_oppositeroleplay.py -c sexual_orientation -l en -t ambiguous_none

python conversation_nosystem.py -c age -l zh -t ambiguous_none
python conversation_nosystem.py -c gender -l zh -t ambiguous_none
python conversation_nosystem.py -c race -l zh -t ambiguous_none
python conversation_nosystem.py -c sexual_orientation -l zh -t ambiguous_none
python conversation_nosystem.py -c age -l en -t ambiguous_none
python conversation_nosystem.py -c gender -l en -t ambiguous_none
python conversation_nosystem.py -c race -l en -t ambiguous_none
python conversation_nosystem.py -c sexual_orientation -l en -t ambiguous_none

python conversation_statement.py -c age -l zh -t ambiguous_none
python conversation_statement.py -c gender -l zh -t ambiguous_none
python conversation_statement.py -c race -l zh -t ambiguous_none
python conversation_statement.py -c sexual_orientation -l zh -t ambiguous_none
python conversation_statement.py -c age -l en -t ambiguous_none
python conversation_statement.py -c gender -l en -t ambiguous_none
python conversation_statement.py -c race -l en -t ambiguous_none
python conversation_statement.py -c sexual_orientation -l en -t ambiguous_none

cd ../mental_deception_discriminative

python specific_mind.py -c age -l zh -t ambiguous_none
python specific_mind.py -c gender -l zh -t ambiguous_none
python specific_mind.py -c race -l zh -t ambiguous_none
python specific_mind.py -c sexual_orientation -l zh -t ambiguous_none
python specific_mind.py -c age -l en -t ambiguous_none
python specific_mind.py -c gender -l en -t ambiguous_none
python specific_mind.py -c race -l en -t ambiguous_none
python specific_mind.py -c sexual_orientation -l en -t ambiguous_none

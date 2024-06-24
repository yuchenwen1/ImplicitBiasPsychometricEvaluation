cd ./baselines_generative
python basic.py -c age -l zh
python basic.py -c gender -l zh
python basic.py -c race -l zh
python basic.py -c sexual_orientation -l zh
python basic.py -c age -l en
python basic.py -c gender -l en
python basic.py -c race -l en
python basic.py -c sexual_orientation -l en

python context+statement.py -c age -l zh -t ambiguous_none
python context+statement.py -c gender -l zh -t ambiguous_none
python context+statement.py -c race -l zh -t ambiguous_none
python context+statement.py -c sexual_orientation -l zh -t ambiguous_none
python context+statement.py -c age -l en -t ambiguous_none
python context+statement.py -c gender -l en -t ambiguous_none
python context+statement.py -c race -l en -t ambiguous_none
python context+statement.py -c sexual_orientation -l en -t ambiguous_none

python baseline.py -c age -l zh
python baseline.py -c gender -l zh
python baseline.py -c race -l zh
python baseline.py -c sexual_orientation -l zh
python baseline.py -c age -l en
python baseline.py -c gender -l en
python baseline.py -c race -l en
python baseline.py -c sexual_orientation -l en

python evaluate_writing.py -c age -l zh -m basic
python evaluate_writing.py -c gender -l zh -m basic
python evaluate_writing.py -c race -l zh -m basic
python evaluate_writing.py -c sexual_orientation -l zh -m basic
python evaluate_writing.py -c age -l en -m basic
python evaluate_writing.py -c gender -l en -m basic
python evaluate_writing.py -c race -l en -m basic
python evaluate_writing.py -c sexual_orientation -l en -m basic

python evaluate_writing.py -c age -l zh -m context_statement_ambiguous_none
python evaluate_writing.py -c gender -l zh -m context_statement_ambiguous_none
python evaluate_writing.py -c race -l zh -m context_statement_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l zh -m context_statement_ambiguous_none
python evaluate_writing.py -c age -l en -m context_statement_ambiguous_none
python evaluate_writing.py -c gender -l en -m context_statement_ambiguous_none
python evaluate_writing.py -c race -l en -m context_statement_ambiguous_none
python evaluate_writing.py -c sexual_orientation -l en -m context_statement_ambiguous_none

python evaluate_writing.py -c age -l zh -m baseline
python evaluate_writing.py -c gender -l zh -m baseline
python evaluate_writing.py -c race -l zh -m baseline
python evaluate_writing.py -c sexual_orientation -l zh -m baseline
python evaluate_writing.py -c age -l en -m baseline
python evaluate_writing.py -c gender -l en -m baseline
python evaluate_writing.py -c race -l en -m baseline
python evaluate_writing.py -c sexual_orientation -l en -m baseline

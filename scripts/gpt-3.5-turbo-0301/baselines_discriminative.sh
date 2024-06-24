cd ./baselines_discrimiative

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

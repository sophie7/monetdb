SELECT MODEL275.is_mutagen, count(distinct MODEL275.model_id ) FROM MODEL MODEL275, BOND T1008290436030  WHERE MODEL275.model_id=T1008290436030.model_id AND MODEL275.logp='3' group by MODEL275.is_mutagen;

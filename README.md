# *_Please send any request to Github (See Source URL!)_*
# Remote configuration
Following remote commands are available:
- set_signals(trainid,signals): set the signals {signal={name,type},count} for the train with this id
- clear_signals(trainid): remove all signals for the train with this id
- get_signals(trainid): get all signals {signal={name,type},count} for the train with this id
- has_signal(trainid,signal): return true if the train with this id has this signal={name,type}
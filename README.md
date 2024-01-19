# *_Please send any request to Github (See Source URL!)_*
# How does it work
No technology required.
When opening the gui for any train, this display an extra one on the left top side. Multiple signals can be added. Those are automatically transfered to the station where the train stops. Signals modified while the train is waiting at the station are immediatly propagated

# Remote configuration
Following remote commands are available:
- set_signals(trainid,signals): set the signals {signal={name,type},count} for the train with this id
- clear_signals(trainid): remove all signals for the train with this id
- get_signals(trainid): get all signals {signal={name,type},count} for the train with this id
- has_signal(trainid,signal): return true if the train with this id has this signal={name,type}




############################################################################################################
TRM                       = require 'coffeenode-trm'
rpr                       = TRM.rpr.bind TRM
badge                     = 'CndTeacup'
log                       = TRM.get_logger 'plain',     badge
info                      = TRM.get_logger 'info',      badge
whisper                   = TRM.get_logger 'whisper',   badge
alert                     = TRM.get_logger 'alert',     badge
debug                     = TRM.get_logger 'debug',     badge
warn                      = TRM.get_logger 'warn',      badge
help                      = TRM.get_logger 'help',      badge
BITSNPIECES               = require 'coffeenode-bitsnpieces'
#...........................................................................................................
### https://github.com/goodeggs/teacup ###
teacup                    = require 'teacup'


#===========================================================================================================
# TEACUP NAMESPACE ACQUISITION
#-----------------------------------------------------------------------------------------------------------
do =>
  for name of teacup
    switch name
      when 'renderable', 'Teacup', 'cede'
        continue
      when 'render'
        my_name = name
      else
        my_name = name.toUpperCase()
    @[ my_name ] = teacup[ name ].bind @


#===========================================================================================================
# FORMS
#-----------------------------------------------------------------------------------------------------------
@TEXT_INPUT = ( Q, label ) ->
  # log TRM.blue 'TEXT_INPUT'
  Q ?= {}
  if label?
    throw new Error "can't have both an unnamed argument and an option called 'label'" if Q[ 'label' ]?
  else
    label = Q[ 'label' ]
    throw new Error "must have either an unnamed argument and an option called 'label'" unless label?
  Q[ 'placeholder'  ] ?= label.replace /\s*:\s*$/, ''
  debug 'TEXT_INPUT', Q
  return @LABEL =>
    @SPAN class: 'label', label
    @INPUT Q

#-----------------------------------------------------------------------------------------------------------
@EMAIL = ( Q ) ->
  # log TRM.blue 'EMAIL'
  Q ?= {}
  label                 = BITSNPIECES.pluck Q, 'label', "your email:"
  Q[ 'name'         ]  ?= 'email'
  Q[ 'type'         ]  ?= 'email'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@PASSWORD = ( Q ) ->
  # log TRM.blue 'PASSWORD'
  Q ?= {}
  label                 = BITSNPIECES.pluck Q, 'label', "your password:"
  Q[ 'name'         ]  ?= 'password'
  Q[ 'type'         ]  ?= 'password'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@CONFIRM_PASSWORD = ( Q ) ->
  # log TRM.blue 'CONFIRM_PASSWORD'
  Q ?= {}
  label                 = BITSNPIECES.pluck Q, 'label', "your password again:"
  Q[ 'name'         ]  ?= 'password-r'
  Q[ 'type'         ]  ?= 'password'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@SUBMIT = ( Q ) ->
  Q ?= {}
  label = BITSNPIECES.pluck Q, 'label', "submit"
  Q[ 'type' ] ?= 'submit'
  return @BUTTON Q, label


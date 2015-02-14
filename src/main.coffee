



############################################################################################################
CND                       = require 'cnd'
rpr                       = CND.rpr.bind CND
# badge                     = 'CndTeacup'
# log                       = CND.get_logger 'plain',     badge
# info                      = CND.get_logger 'info',      badge
# whisper                   = CND.get_logger 'whisper',   badge
# alert                     = CND.get_logger 'alert',     badge
# debug                     = CND.get_logger 'debug',     badge
# warn                      = CND.get_logger 'warn',      badge
# help                      = CND.get_logger 'help',      badge
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
  # log CND.blue 'TEXT_INPUT'
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
  # log CND.blue 'EMAIL'
  Q ?= {}
  label                 = CND.pluck Q, 'label', "your email:"
  Q[ 'name'         ]  ?= 'email'
  Q[ 'type'         ]  ?= 'email'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@PASSWORD = ( Q ) ->
  # log CND.blue 'PASSWORD'
  Q ?= {}
  label                 = CND.pluck Q, 'label', "your password:"
  Q[ 'name'         ]  ?= 'password'
  Q[ 'type'         ]  ?= 'password'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@CONFIRM_PASSWORD = ( Q ) ->
  # log CND.blue 'CONFIRM_PASSWORD'
  Q ?= {}
  label                 = CND.pluck Q, 'label', "your password again:"
  Q[ 'name'         ]  ?= 'password-r'
  Q[ 'type'         ]  ?= 'password'
  Q[ 'required'     ]  ?= yes
  return @TEXT_INPUT Q, label

#-----------------------------------------------------------------------------------------------------------
@SUBMIT = ( Q ) ->
  Q ?= {}
  label = CND.pluck Q, 'label', "submit"
  Q[ 'type' ] ?= 'submit'
  return @BUTTON Q, label


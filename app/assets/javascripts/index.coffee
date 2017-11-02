# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Controller
  @_pathname: ''

  constructor:() ->
    @constructor._pathname = window.location.pathname
    $.ajaxSetup {
      headers: {
        'X-CSRF-Token': $("meta[name=csrf-token]").attr('content'),
        'Content-Type': 'application/json'
      }
    }

  prepare:() ->
    if @constructor._pathname == "/callback"
      return new Callback();

class Callback

  run: () ->
    _data = un_hash(window.location.hash.substring 1)
    @invalidate(_data)

  invalidate: (json_data) ->

    $.ajax {
      url: '/callback',
      type: 'POST',
      dataType: 'json',
      data: json_data,
      success: (data) ->
        console.log data
      error: (e) ->
        alert 'an error occured'
    }

un_hash = (data) ->
  _data = data.split '&'
  _result = '{'
  for val in _data
    _val = val.split '='
    _result += "\"#{_val[0]}\": \"#{_val[1]}\","
  _result = _result.substr(0, _result.length - 1)
  _result += '}'
  return _result


$('document').ready ->
  _controller = new Controller()
  _runner = _controller.prepare()
  if typeof _runner != "undefined"
    _runner.run()
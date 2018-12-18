# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  new Morris.Donut({
    element: 'myfirstchart',
    data: [
      { label: gon.zipOne, value: gon.zipOneValue },
      { label: gon.zipTwo, value: gon.zipTwoValue },
      { label: gon.zipThree, value: gon.zipThreeValue
      }
    ]});